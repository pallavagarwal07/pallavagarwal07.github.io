---
title: "Preparation for Google Summer of Code"
layout: default
img: gsoc.png
img-alt: Google Summer of Code banner
tags: post
---
**Preface:** I have been selected for Google Summer of Code ’16 under Gentoo
Organization.

Firstly, I would suggest that you start now. Since I do not know anything about
your background, I will start at the beginning. Feel free to jump to the
relevant point in the process. But DO NOT skip anything as irrelevant.

**The basics:**

To start, first you need the right tools.

Learn (read “master”) at least one VCS (Version Control System). Since git is
the most common and the most popular, I recommend you start with that, however
knowing what svn and mercurial are won’t hurt. Start committing EVERYTHING you
code online. It doesn’t matter if your code sucks, you will improve. But even
the stupidest things you code need to be online.

Make your own github repositories, play around. You wouldn’t believe how much
you can learn just while playing with different ideas.

**The essential:**

Needless to say, shift to open source. Get rid of windows, install Linux, start
befriending your terminal. Avoid non-free (google this term) software as much
as possible. Start becoming familiar with the tools you use. This isn’t
difficult, if you use linux on a daily basis, you are pretty much set.

**Start small:**

You’ll need to work with someone else’s code. Actually the organization you
will work for, will have code from tens to hundreds of developers. It is very
easy to be scared of looking at such a code. Which is why, you need to start
small. If you have computer courses, borrow codes from your friends or help
them with debugging. Get a bit comfortable with understanding someone else’s
code. Helping your friends out with their codes is probably one of the easiest
way to achieve that.

**Slowly increase your reach:**

Go to Github Explore and look for projects that seem interesting. You’ll often
find things reported in the issues section that seem easy enough to fix. Fix
them! If you followed the first part, you should already know how to contribute
your changes (google - pull request)

**Communicate:**

**I can’t stress this enough.** Ask for advice. If you are looking at an
interesting project with a bug you want to fix, but can’t seem to understand
how, ASK THE DEVS! In most cases, they’d know what to do but have been too busy
to actually fix it. In rare cases, it might be because it needs too much manual
labor (refactoring of code for example). Take the initiative and do the work.
Believe me, after your first accepted pull request, you’ll be much more
confident about the next one.

**But what does this have to do with GSoC?**

Experience. This is the only form of preparation that counts. I’ve heard people
(many of whom have never been selected in GSoC) that a kickass proposal is all
that matters. This is NOT true. A kickass proposal can be a free entry to GSoC
but not having such a proposal doesn’t mean you have no chance, it means you’ll
have to improve the proposal before the deadline.

Wait, what?

What I mean to say, that if you are enthusiastic enough, the mentors of the
project would help you to ensure that you have a kickass proposal in the end,
and so it doesn’t matter if you don’t begin with an awesome one.

Another thing that I’ve often heard thrown around is that you need to be
affiliated with the organization or be working with it beforehand to get
selected. This isn’t at all true either. I came in contact with my organization
only after the proposal time had started and here I am answering this question.

Ok, I will do the above. Anything Else?

Maybe. One another thing I would like to suggest is to keep a written record (I
mean a blog) of everything you do. Maybe you learnt something new in git, or
learnt to fix something in your operating system. This is advisable due to 2
reasons. It is very likely that you will run into a similar problem again, and
it is VERY handy to have your previously found solutions with you. Other, this
doesn’t only help retain your interest, it goes a long way to show others that
you are interested in something, and that includes the mentors you’d be
applying to.

All the above seems like general advice, sort of like what you’d find in any
website. So I’ll end (in a few more paras) by telling what I did to achieve
this for the past year.

**My Backstory:**

A little more than 1 year ago, I was in first year, with my endsems nearing
when I first heard about GSoC (I actually had no idea, it existed).

My experience till then: Fairly good at coding (c, c++, python) but nothing to
show for it. One git repo of a group competition in robotics. That’s it.

I applied for GSoC but I didn’t have any confidence in my work and I didn’t
make much contact with the mentors. The project required to do some programming
tasks which I did without breaking a sweat. After writing a long detailed and
well thought out proposal about the project, I submitted the draft. Then I
started waiting.

Big Mistake. I pretended I was waiting for some sort of contact from the
mentors but the truth was, I am usually dead scared of conversation and I was
fooling myself by saying that I don’t want to bug the mentors. You have to bug
the mentors.

Anyway, I wasn’t selected - big surprise :/

I took a project under a professor, and started coding my summers anyway.

This time however, I wanted to see what I could do so that I wouldn’t fail next
year. So I started exploring more and more github. Try it - even if you don’t
want to contribute. It is a pleasurable experience to surf through some
amazingly awesome code pieces. Note that some of the most starred repos contain
less than 100 lines of code. Surely you can gather the courage to try and
understand them?

Around this time I had taken a huge interest in Operating Systems. I came
across a project LFS (linux from scratch) in which all packages are manually
compiled, starting from the compiler itself. Fascinating :P So I tried it. I
didn’t have open source or git or gsoc in mind. I did it because it was fun,
and I like learning something new. And compiling so many packages, I also
developed a respect for our dear package managers (apt-get, pacman, portage).
Anyway, when I saw a github project facebook/pathpicker, with a community
request for packaging scripts, I was intrigued. I had already done so much
compiling and played with package managers so much, it seemed easy to write
scripts to make a debian package. So I did. And the developers were pleased
with the work. Don’t get me wrong - the work was trivial - but the fact that
developers were nice enough to show their appreciation gave me a morale boost.

Similarly, the text editor I use (neovim - fork of vim) was misbehaving a
little, so I went to its github repo and made a new issue. They never fixed it,
but I got to talk to some really awesome developers and got to know why
something like that would be really hard to fix. There were several small
incidents like this, and I can’t go into detail over every one.

I also started a blog (<https://www.varstack.com>) where I started writing
posts whenever I found something really interesting, for example when I first
learnt to use SSH port forwarding (that one was recent, and mind blowing).

So, when the judgment day arrived, that’s how I sold myself. My proposal was
detailed about the project, but it was nowhere near perfect. But I explained
very clearly who I was and what I liked. I told about my experience with
package managers and my fascination (the project I applied for is related to
package manager automation). I told truthfully that my daily driver OS is NixOS
and I would be installing Gentoo for the second time in my life (which would
mean that everything in the organization was completely new to me, and they
knew it). But I assured them that my experience with different OSs will only
help me with this task. I kept in contact with my mentors, asking for opinion
on every part of my proposal. I messaged other active people on IRC (internet
relay chat) asking for their opinions, and shamelessly gave my opinions on
their project page ideas. I did every task they gave me, and kept bugging my
mentors for more. Even though I had never used Gentoo before (properly), I was
able to complete the tasks they gave me in exceptionally small times, which was
due a conscious effort “What if a few minutes extra to the task gain me the
selection?”.

This isn’t preparation for University exam, you don’t have to have that state
of mind for 2 years. It’s a single week of proposal submission in which you
might lose sleep. And now I can easily say it was worth it.

**Note 1:** Losing sleep also refers to the fact that I kept my phone on full
notification volume so that I was responsive to my mentor’s mails even if I had
to wake up in the middle of the night (different time zones :/). This was
probably overkill, and I’m not advising you do that. But showing some
enthusiasm will go a long way.

**Note 2:** The week of proposal submission is important, but the month that
follows before the result is also not to be neglected. The mentors will tell
you if they expect you to work during that time too, and I think it’s a good
sign if they do ;)

**Note 3:** I didn’t say anything about how to choose an organization, because
I really don’t know. Some people say that you should apply to organizations
that have the most slots (predicted from previous years), while some people say
to choose the ones least people will think to apply to. I personally chose one
I thought I would enjoy working with, since I already mentioned that I am
fascinated with operating systems and package managers (ever want to try
something cool? try nixos - one of the most amazing OS I have ever seen -
sorry, I couldn’t resist :P )

Best of luck with your preparation (coding) and get to work (coding).
Remember, never hesitate to ask for help (my contact details can be found on
the "About me" page).

Pallav Agarwal (<https://github.com/pallavagarwal07>)

**Note 4:** This article was originally written as a Quora answer, and can still
be found on the website.

