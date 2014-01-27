## Define Me


"<i>Mating</i> is I think the only book in which the issue of people resorting to their dictionaries has come up. I thought it was clear in the book, but I guess it wasn’t, as I still occasionally have to explain that Karen Ann Hoyt’s extensive vocabulary was built as part of her ladder up and out of her disadvantaged origins. It’s about her, of course, and not about the precise meaning of every word she uses."<br>
- Norman Rush [on his first novel](http://www.slate.com/articles/arts/books/2013/09/norman_rush_author_of_mating_and_subtle_bodies_and_his_editor_at_knopf_ann.2.html)


An old habit of mine is writing down a word whose definition I either do not know or am not more than 90% certain of. Lists appear in the margins of books, in notebooks, on the covers of magazines, on receipts and Post-it notes too. But the practice grows unruly at times. It would be better to have all the words in one central place. And better still to be able to track how many times I've looked up a word. (Some words, like loves, remain elusive.)

Define Me looks up a word with [Wordnik](https://www.wordnik.com/) and store its definition in a database table. Before running the script, you'll have to sign up for a [Wordnik
API key](http://developer.wordnik.com/) if you haven't already. I connect to a MySQL server, but
you can [specify another connection](http://datamapper.org/getting-started.html).

### Installation

Install required gems:<br>
<code>bundle install</code>

### Run

Retrieve a word and save it to the database:<br>
<code>ruby bin/word_lookup.rb</code>
