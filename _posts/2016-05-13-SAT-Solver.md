---
title: "Determining legal USE Flag combinations using a CNF SAT Solver"
layout: default
tags: post
---

I spent my time doing something rather interesting today.

In my proposal, I had
mentioned that the USE flag combinations to be tested would be:

>Without any USE flag turned on
>
>With all USE flags turned on
>
>Few random combinations based on default flags,
>or inverse of default flags or those generated by tatt.

Yesterday, a guy, Harald Timeraider pointed out that some of the USE flag combinations
given by the above rules may not be legal. For example, if an ebuild specifies
`REQUIRED_USE="^^ (a b c)"` then EXACTLY one flag out of `a`, `b`, and `c` should be
enabled. This doesn't fall under "without USE flags" or "with all USE flags" category.

At first I was thinking that for combination os USE flags, I would use the portage API
to verify if the USE flag combo was valid and is not, I would randomly generate another
combination. But soon, as it always happens, I began to overthink the problem and
decided to model the problem as a graph problem. More specifically, as a boolean
satisfiability problem.

So, long story short, here's what I did at
[SummerOfCode16](https://github.com/pallavagarwal07/SummerOfCode16/blob/dd07d92004b60a00531881773ed6a0a1b41fbd35/Containers/scripts/FlagGenerator/solver.py).

We have five main kinds of operators.

1. `|| (flag1 flag2 flag3..)` operator means that the following bracket would need to have AT LEAST one flag
enabled. This is a simple OR operator between the operands.

2. `flag1? (flag2 flag3 ...)` operator means that the following bracket would have to be
true as a whole if `flag1` is enabled. This is equivalent to the implication operator.

3. `^^ (flag1 flag2 flag3..)` operator means that the following bracket will have
EXACTLY one flag enabled. The wiki describes it as an XOR operator, which I believe is
inaccurate since XOR should allow odd number of operands to be true. For my case, I
model it as a 1-from-n operation. For example, for three variables `a, b, c`:<br/>
<center><code>(a & !b & !c) | (!a & b & !c) | (!a & !b & c)</code></center> 

4. `!flag1` operator is basically a negation.

5. `flag1 flag2` operator (whitespace) is basically an AND operation unless the parent
bracket is preceded by `||` or `^^`.

Also, because I was having fun and wasn't sure if Portage supported it, I added support
for arbitrary amount of nesting, given that the above rules are all followed.

The code I wrote uses `satispy` to convert constructed SAT formula into CNF form, and
replaces variables by numbers to convert into a format that `pycosat` can accept.

Even though `satispy` also has support for solving the CNF formula, I went with `pycosat`
for actually solving the CNF formula because it provides an iterator to get as many
solutions as I want. Also the output is a bit easier on the eyes in the form of numbers.

If you have any queries, post them below or open up an issue on github.

<i>Thanks for reading</i>
<br /><br />