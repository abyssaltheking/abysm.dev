# Contributing

Thank you for having interest in contributing! Contributions, even small ones, are imperative to the success of abysm.dev. 

## Creating Issues
When creating issues, please check to be sure you aren't making a duplicate issue. Be specific and give as many details as possible. Make sure to label your issue appropriately as well.

## Creating Pull Requests (PRs)
Make sure you clearly state the issue and what was done to solve it. If possible, provide the issue number. Ideally, you should submit smaller pull requests, one at a time, for them to be reviewed faster and make it easier on me, as currently there is only one person behind this.

## On AI Use
As much as I hate to say it, there is no getting around AI generated contributions. There is never going to be a policy that can be accurate enough to outright ban AI from contributions. 

However, it is *heavily* discouraged to use AI to make contributions, but if you must, **please disclose that you used AI and what you used it for at the top of your PR.** It will still be reviewed as normal, I just value honesty.

***If I can tell it's AI and you didn't disclose it, your PR will not be accepted.***

## Code Conventions
- Use descriptive variable and function names. 
    > A variable initialized as `lvy = 0` tells the reader absolutely nothing about what its purpose in life is. 
    
    Instead, you need to make sure your names actually describe what they mean. It's okay to have a longer name for something, the vast majority of developers have autocomplete, so going back to `lvy`, we can instead name this `linearVelocityY = 0`, and all of a sudden it's much easier to read. The same rule goes for functions and parameters.
- Use 4 spaces or 1 tab per level of indentation across the entire project.
- Naming conventions depend on which part of the project you wish to contribute to, but it's pretty standard to what's normal for each language.
    - For `/src/client`, use `camelCase` for variables and functions, `PascalCase` for types and classes, and `SCREAMING_SNAKE_CASE` for constants.
    - For `/src/engine`, use `snake_case` for variables and procedures, and `PascalCase` for types.
    - For `/src/server`, use `PascalCase` if the value is exported, otherwise use `camelCase`.
- Operators and control flow statements should have spaces between values, like `for (condition) { }` instead of `for(condition){ }` and `9 / 3` over `9/3`.
- Pointers should go in front of the type, so in Go, for example, it would look like:
<br>`func updatePlayer(player *Player)`
- Omit braces where possible when working in `/src/client`. If you can write it in a single line, it is much preferred for all languages.
