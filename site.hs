--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative ((<$>))
import Control.Monad (forM_, forM)
import Data.List (sortBy)
import qualified Data.Map as M
import Data.Monoid (mappend, mconcat)
import Data.Ord (comparing)
import Hakyll
import Hakyll.Core.Configuration (defaultConfiguration)
import System.Locale (defaultTimeLocale)
-- import Debug.Trace (trace)


import Hakyll

postsPattern = "posts/*/*/*/*/index.markdown"
--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

    -- Copy assets
    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler
    
    -- Render posts
    match postsPattern $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html" postContext
            >>= loadAndApplyTemplate "templates/default.html" siteContext
            >>= relativizeUrls

    -- Render list of all posts
    create ["posts.html"] $ do
        route idRoute
        compile $ do
            list <- postList postsPattern chronologicalItems
            makeItem ""
                >>= loadAndApplyTemplate "templates/posts.html" 
                    (constField "posts" list `mappend` siteContext)
                >>= loadAndApplyTemplate "templates/default.html" siteContext
                >>= relativizeUrls

    -- Render list of number of recent posts
    create ["index.html"] $ do
        route idRoute
        compile $ do
            list <- postList postsPattern $ fmap (take 12) . chronologicalItems
            makeItem ""
                >>= loadAndApplyTemplate "templates/index.html" 
                    (constField "posts" list `mappend` siteContext)
                >>= loadAndApplyTemplate "templates/default.html" siteContext
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

--------------------------------------------------------------------------------
siteContext :: Context String
siteContext =
    constField "homeurl" "http://mateusz.loskot.net" `mappend`
    constField "brand" "Mateusz Loskot" `mappend`
    constField "tagline" "hacking on, working out, living up" `mappend`
    constField "author" "mloskot" `mappend`
    constField "email" "mateusz@loskot.net" `mappend`
    constField "linkedin" "linkedin.com/in/mateuszloskot" `mappend`
    constField "gplus" "gplus.to/mloskot" `mappend`
    constField "aboutme" "about.me/mloskot" `mappend`
    constField "twitter" "twitter.com/mloskot" `mappend`
    constField "github" "github.com/mloskot" `mappend`
    constField "ohloh" "ohloh.net/accounts/mloskot" `mappend`
    constField "flickr" "flic.kr/mloskot" `mappend`
    constField "youtube" "youtube.com/mloskot" `mappend`
    constField "vimeo" "vimeo.com/mloskot" `mappend`
    constField "cadcorp" "cadcorp.com" `mappend`
    constField "osgeo" "osgeo.org" `mappend`
    defaultContext

postContext :: Context String
postContext =
    dateField "datetime" "%Y-%m-%dT%H:%M:%SZ" `mappend`
    dateField "date" "%d %b %Y" `mappend`
    siteContext

-------------------------------------------------------------------------------
postList :: Pattern -> ([Item String] -> Compiler [Item String])
         -> Compiler String
postList pattern preprocess' = do
    postItemTpl <- loadBody "templates/postitem.html"
    posts       <- (loadAll pattern) >>= preprocess'
    applyTemplateList postItemTpl postContext posts

chronologicalItems :: [Item a] -> Compiler [Item a] 
chronologicalItems items = do 
    withTime <- forM items $ \item -> do 
        utc <- getItemUTC defaultTimeLocale $ itemIdentifier item 
        return (utc, item)
    return $ map snd $ reverse $ sortBy (comparing fst) withTime 
