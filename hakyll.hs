{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (id)
import Control.Category (id)
import Control.Arrow ((>>>), (***), (+++), arr)
import Data.List (intercalate, sortBy, isPrefixOf)
import Data.Monoid (mempty, mconcat)
import Data.Ord (comparing)
import System.FilePath (takeFileName, takeDirectory,
                        joinPath, splitDirectories, dropExtension)

import Hakyll

instance Writable b => Writable (Either a b) where
  write p (Right b) = write p b
  write _ _ = return ()

main :: IO ()
main = hakyll $ do

    -- Copy static files (more or less)
    match "css/*" $ do
        route idRoute
        compile compressCssCompiler

    -- Render each and every post
    match "posts/*/*/*/*.markdown" $ do
        route   $ setExtension ".html"
        compile $ pageCompiler
            >>> myMetadataA
            >>> arr(renderDateField "date" "%d %b %Y" "Unknown Date")
            >>> applyTemplateCompiler "templates/post.html"
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

    -- Render list of all posts
    match "posts.html" $ route idRoute
    create "posts.html" $ constA mempty
        >>> myMetadataA
        >>> arr (setField "title" "Posts")
        >>> requireAllA "posts/*/*/*/*.markdown" addPostList
        >>> applyTemplateCompiler "templates/posts.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    --- Render list of posts in category: code
    match "code.html" $ route idRoute
    create "code.html" $ constA mempty
        >>> myMetadataA
        >>> arr (setField "title" "blog::code")
        >>> requireAllA "posts/*/*/*/*" (filterCategory >>> addPostList)
        >>> applyTemplateCompiler "templates/posts.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    -- Render index
    match "index.html" $ route idRoute
    create "index.html" $ constA mempty
        >>> myMetadataA
        >>> setFieldPageList (take 9 . sortChronological)
            "templates/postitem.html" "posts" "posts/*/*/*/*.markdown"
        >>> applyTemplateCompiler "templates/index.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

       --- >>> requireAllA "posts/*/*/*/*.markdown" addPostList

    -- Compile templates
    match "templates/*" $ compile templateCompiler

-- Site configuration metadata
myMetadataA = arr (trySetField "homeurl" "http://mateusz.loskot.net")
    >>> arr (trySetField "brand" "Mateusz Loskot")
    >>> arr (trySetField "tagline" "code, sweat and adventures")
    >>> arr (trySetField "author" "mloskot")
    >>> arr (trySetField "email" "mateusz@loskot.net")
    >>> arr (trySetField "github" "github.com/mloskot")
    >>> arr (trySetField "twitter" "twitter.com/mloskot")
    >>> arr (trySetField "flickr" "flickr.com/photos/mloskot")
    >>> arr (trySetField "youtube" "youtube.com/mloskot")
    >>> arr (trySetField "vimeo" "vimeo.com/mloskot")
    >>> arr (trySetField "linkedin" "linkedin.com/in/mateuszloskot")

-- | Helper functions
--

-- | Auxiliary compiler: generate a post list from a list of given posts, and
-- add it to the current page under @$posts@
--
addPostList :: Compiler (Page String, [Page String]) (Page String)
addPostList = setFieldA "posts" $
    arr (sortChronological)
        >>> require "templates/postitem.html" (\p t -> map (applyTemplate t) p)
        >>> arr mconcat
        >>> arr pageBody

-- | Sort pages chronologically. This function assumes that the pages have a
-- @year/month/day/title[.extension]@ naming scheme.
-- Source: https://github.com/ian-ross/blog/
--
sortChronological :: [Page String] -> [Page String]
sortChronological = reverse . (sortBy $ comparing pageSortKey)


-- | Generate a sort key for ordering entries on the index page.
-- Source: https://github.com/ian-ross/blog/
--
pageSortKey :: Page String -> String
pageSortKey pg =  datePart ++ "/" ++ (if ts /= "" then ts else namePart)
  where path = getField "path" pg
        ts = getField "timestamp" pg
        datePart = joinPath $ take 3 $ drop 1 $ splitDirectories path
        namePart = case (takeFileName path) of
            "text.markdown" -> last $ splitDirectories $ takeDirectory path
            _               -> dropExtension (takeFileName path)

isCategory :: Page a -> Bool
isCategory p =
  let category = getField "category" p in
  category == "code"

isPageCategory :: Compiler (Page a) (Either (Page a) (Page a))
isPageCategory = arr (\p -> if isCategory p then Right p else Left p)

filterCategory :: Compiler (Page a, [Page b]) (Page a, [Page b])
filterCategory = id *** arr (filter isCategory)
