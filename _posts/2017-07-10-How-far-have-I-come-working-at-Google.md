---
title: "An intern's views - How far have I come?"
layout: default
tags: post
---

AKA, what the hell about work? I have gone on and on about getting here. The
things I found here. But I have still made no mention of what I do here. Well,
here it is. So sit back, and read on.

1. [An intern's views - How I got here](/2017/05/07/How-I-got-here/)
2. [An intern's views - A month's end at Google](/2017/06/07/A-month-end-at-Google/)
3. [An intern's views - How far have I come?](/2017/07/10/How-far-have-I-come-working-at-Google/)
4. An intern's views - End of diary

In case you haven't read the last article, you might want to.

So where were we? Oh yeah, end of orientation (week 1). So, after week 1,
interns actually start working in full force. Now, the command structure is
something like this - I'm an intern. I have a host who is responsible for
hosting my project. He is primary reviewer on all my code, and my main point of
contact in case of any problems. Apart from my host, I have a second reviewer,
who is basically the person who has worked on similar stuff before and is in
the best position to help me deploy my code.

Above them is our manager, and then more managers above him (in a nutshell).

So what do I work on? Hmmm.. I am not sure if I'm allowed to say yet?

```
TODO: Replace with a proper description of my  work after project is released
as open source.
```

Anyway, I am in the Blaze team. Blaze is the internal name for Bazel
(<https://bazel.build>). To understand what Blaze is, first let's jog your
memory. Which names do you recognize?

* Make (Makefile)
* Ant
* Maven
* CMake
* Gradle

All the above mentioned are build tools, and they all work on a similar
concept. You have a build configuration, and they try to build the project by
minimizing the work done. For example, if only one file has changed, they'd try
not to build the whole project again, but just that one file. Now as projects
become complicated, these tools become inefficient, and slowly more and more
incompetent. Google has all their source code in one huge repository (really
really huge), and code can takes hours to build on parallel running machine
clusters. These tools can neither handle such complexity, nor the functionality
required for such a thing.

This is where Bazel (Blaze) comes in. Blaze is *the* build tool used by every
project in Google. It is what builds tens of thousands of projects everyday.
Now, Bazel is the open source version of Blaze, which other people can use in
their projects, but is mostly used by other companies (like Dropbox), whose
requirements are that huge.

If you are in a CS related field, you would've heard the term "correctness"
thrown around a lot. Proof of correctness of algorithms? Correctness in multi
threaded systems? Anyway, the main aim for a build tool is to ensure that the
build output is always correct (deterministic). Thus, the changing
circumstances should not change the build. For example, if a project A does not
depend on project B, then whether or not you have B installed should not have
an effect on build of A.

One important way to ensure correctness is to sandbox the compiler. This
basically means to remove anything that might affect the build, except for the
dependencies declared by the programmer. Now this can be quite slow to do for
1000s of parallel builds, having 10,000s of dependencies. The current approach
can take up to 300% extra time for a build with sandboxing enabled than
disabled for some projects with a lot of dependencies. My project is a
completely different (and hopefully fast) approach to solving this.

Back to working at Google; how does the work feel? One word - challenging. I
take up problems quickly, I can code fast, I can even understand libraries,
APIs faster than people expect me too. But I was not prepared for this. I don't
think I'm the only one who felt this way. My friends, who are interning at
Google or even other big companies felt the same. Programming in a company is
not the same as programming projects as a hobby.

What am I talking about? Code Reviews, Lints, Style Guides. Writing code for
Google is not the same as writing code for oneself. Your code needs to work,
but that is low priority (okay, not really). Anybody reading your code should
be able to understand what it does, and that's high priority. I'm not
complaining, I have learnt more about writing "good" code in the last two
months than I did in years coding by myself. However, I am going on this rant
because I want whoever is reading this, to realise that if you are in college
right now, you have a wonderful opportunity to learn to write "good" code.

What are code reviews? Code reviews are comments on your code, asking you to
fix problems (that you didn't even think were present) using alternatives you
would've never come up with yourself. Frankly, the first time around, code
reviews feel something like this:

<img src="/img/review.png" width="100%" />

For the record, I made that meme for memegen ***after*** I finally got my first
pull request (or change list) accepted. It got 850+ upvotes, so I'm pretty sure
I'm not the only one who felt this way.

Hmmm... Memes should be standard way of getting a point across. Memegen is full
of memes about "Intern's first pull request", because it is a standard scene.
Intern comes, confident, writes a bunch of code, sends it for review, and BAM!
40+ comments on the code. Been there, done that. My first pull request (~400
lines) had over 90 comments and was finally submitted after 2 weeks when I had
managed to please all the reviewers by fixing every problem.

Why am I writing about all this? Do I still feel the pain? Well, yes, but a lot
less than I originally did. After the code reviews, the code actually does look
a lot better. It also gives a sense of inferiority, that takes time getting
used to. At my college, there are a total of 2 people who can make me feel
inferior (in programming). At Google, every second employee manages to do it
with ease. We were told in our orientation that almost 70% of the Googlers have
felt that they don't belong here due to inferiority complex at some point in
their lives. But then a Googler comes along and asks for my help in area he
doesn't have any experience in, and the feeling goes away. These people aren't
all superior, they have just been working among the best too long.

Best part of working at Google? The Googlers. Not only are the people here
brilliant at what they do, I have actually met some of the most down to Earth
people here.  And the benefit of working with the best people? I have a doubt
in Go; the Go team sits 6 rows from my desk. I need help implementing
something? I bet at least 3 people in the 50 step radius have done it before.
Can't remember the name of that one spaceship from Star Trek? I'm pretty sure 1
out of 5 people here know that too. I don't even need to Google my doubts that
often because somebody can usually clear them up (yeah, I can see the irony).

*I know most of you don't care about how my project is going, but I'm going to put
it here anyway :P It's going well, and I had a fairly nice mid-term review. I'm
currently pushing hard to get the project released as open source (lots of
legal issues to solve in the way). Finger crossed :D*

So, any regrets? Yes, from back at college. I really wish somebody had told me
about all this. Told me that the programming as I know it, isn't exactly how
it's done in real life. I wish I had had someone read all my codes, just to see
if they can understand it. I wish I had an expert nit-picking on my codes just
so having that now wouldn't be so surprising.

Next steps? I like to help out others, so let's hope I can help a few people
avoid this shock. For now, mandatory code reviews on Programming Club IITK
repositories, adding test suites and continuous integration to important
projects and planning lectures on just these topics.
<br/> <br/>

*Doubt? Question? Suggestion? I think the comment panel below works :)*
