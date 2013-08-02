# Welcome to Inquisit!

This is an imitation of quora.com. I built it from the ground using these technologies:

* [Ruby on Rails](rubyonrails.org/)
* [PostgreSQL](www.postgresql.org/)
* [Backbone.js](backbonejs.org/)
* [Backbone-relational.js](backbonerelational.org/)
* [Twitter Bootstrap](twitter.github.io/bootstrap/)
* [Devise](github.com/plataformatec/devise).

### You can sign in with the guest account:

* email: guest@inquisit.com
* password: 12345678

## [Try it out!](//inquisit.herokuapp.com/users/sign_in)

### Current features include:

* Asking and editing questions.
* Answering said questions.
* Adding, removing, and editing topics.
* Viewing questions by topic.
* User profiles. -- still tweaking this one.
* Upvoting/downvoting questions.
* Server-integrated [autocomplete](wolvman.tumblr.com/post/55091970585/autocomplete-with-ajax-week-9-day-2).

### Featured code:
* [Arel Query Chaining](github.com/wolverdude/Inquisit/blob/master/app/models/answer.rb#L9-25)
* [Backbone Memory Management](github.com/wolverdude/Inquisit/blob/master/app/assets/javascripts/views/questions/questions_show.js#L64-81)
* [Basic Dual-Template Backbone Subview](github.com/wolverdude/Inquisit/blob/master/app/assets/javascripts/views/parent_views/show_edit_sub_view.js)
* [Server-Integrated](github.com/wolverdude/Inquisit/blob/master/app/models/answer.rb#L8-22) [Typeahead](github.com/wolverdude/Inquisit/blob/master/app/assets/javascripts/views/subviews/topics.js#L24-100)
* [Object-Oriented SCSS](github.com/wolverdude/Inquisit/blob/master/app/assets/stylesheets/root.css.scss#L67-103)

### Unique challenges:

* There was a 3n+1 queries problem in my [Answers model](github.com/wolverdude/Inquisit/blob/master/app/models/answer.rb). To solve it, I had to write a farily complex SQL query that I wrote about in [my blog](wolvman.tumblr.com/post/55236373131/kicking-n-1s-butt-with-custom-rails-queries-week-9).
* I had a lot of code duplication in my Backbone sub-views, so I created a [generic sub-view class](github.com/wolverdude/Inquisit/blob/master/app/assets/javascripts/views/parent_views/show_edit_sub_view.js) that I extended for all my subviews.
* In Backbone a memory leak will occur if you don't explicitly unbind listeners from an old view.  This can be accomplished by executing `remove()` on the view, but this doesn't remove listeners from any subviews it may have.  To solve this, I wrote [methods](github.com/wolverdude/Inquisit/blob/master/app/assets/javascripts/views/questions/questions_show.js#L64-81) to keep track of subviews and unbind them when the parent view is removed.
* Backbone-relational has some quirks:
  * You cannot instantiate the same object twice. This makes sense, but it throws an error when you try to do this instead of merging the two objects. There is a way to do this, but only if you have the object's id.  I didn't, so I had to come up with a [workaround](github.com/PaulUithol/Backbone-relational/issues/355).
  * There's a weird [glitch](stackoverflow.com/questions/15117035/backbone-fires-add-event-after-sort-on-backbone-relational-collection) where backbone-relational triggers an event in my [Topics sub-view](github.com/wolverdude/Inquisit/blob/master/app/assets/javascripts/views/subviews/topics.js) from my [Topics router](github.com/wolverdude/Inquisit/blob/master/app/assets/javascripts/routers/topics_router.js). Simple to fix, but hard to track down.
* The font I chose for the logo wasn't supported on most browsers, so I had to force-load it with CSS3 `@font-face`.
* Immitating (not copying) Quora.com's [styling](wolvman.tumblr.com/post/55132894770/styling-in-place-week-9-day-3).

## Seriously, [try it out!](//inquisit.herokuapp.com/users/sign_in)
