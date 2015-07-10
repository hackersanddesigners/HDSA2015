Welcome to Publisher
====================

What is Publisher?
------------------

Publisher is a digital publishing platform based on git in order to facilitate openness, collaboration and editorialization of the act of publishing using the constructs of the software engineering source control.

How does it work?
-----------------

Authors create content using Markdown.  Markdown is an easy to read, easy to write formatting language.  You read about and learn it here: [http://daringfireball.net/projects/markdown/](http://daringfireball.net/projects/markdown/).

The work flow
-------------

It is extremely easy to publish with Publisher, however it does require some new tools which maybe foreign to non-programmers, namely git and the terminal.

Step 1.
Sign up at [github.com](http://github.com).

Step 2.
Visit the main publisher repository here: [https://github.com/bgraves/publisher](https://github.com/bgraves/publisher).  Click the "Fork" button.

![Fork image](fork.png "Fork")

Step 3.
Clone the repository.  You can do this in the Terminal be executing:

`git clone https://github.com/bobtaco/publisher.git`

or Downloading Github Desktop here: [https://mac.github.com/](https://mac.github.com/)

Step 4.
Change the markdown files as you wish or create new ones. Github user "bobtaco" added this sentence. He is collaborating with "bgraves".  He will then commit his sentence, and sync w/ his repository, also known as "pushing".

`
git commit -am "This is comment about what I changed!"
git push origin master
`

Step 5.
"bobtaco" will ask "bgraves" (the editor) to check his addition to the publication via a "Pull request".  You can do this on the Github website.
![Pull image](pull.png "Pulling")

Step 6.
"bgraves" will review the change in a branch, and merge them if it's good content.

`
git checkout -b bobtaco-master master
git pull https://github.com/bobtaco/publisher.git master
git checkout master
git merge --no-ff bobtaco-master
git push origin master
`

Step 7.
When the publication is complete "editors" can publish it.  This is done first by adding the publishing destination repository, YOU ONLY EVER HAVE TO DO THIS ONCE.  And you will have to be given a key to access the server.

`git remote add publish ubuntu@52.17.56.97:publisher.git`

Step 8.
Publish the PDF.

`git push publish master`

The end
=======



