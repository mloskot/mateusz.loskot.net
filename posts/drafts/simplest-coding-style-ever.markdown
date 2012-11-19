

    Names of directories and files should be all lowercase. Add hyphens between words.
    Variable names should be camelCase.
    Objects (functions) meant to be instantiated should start with a capital letter.
    Private scope doesn’t exist in JavaScript except through closures. See the poorly-named module pattern for more info but I don’t really love the consequences of the pattern. Instead, I suggest prefixing names of members meant to be private with an underscore. It doesn’t provide true privacy, but it’s a pretty solid red flag that you shouldn’t use it publicly.

