Example using Chrome for Testing with Ruby

```
heroku create chrome-for-testing-ruby
heroku buildpacks:set heroku/ruby
heroku buildpacks:add -i 1 heroku-community/chrome-for-testing 

heroku run bash
> ruby main.rb
```