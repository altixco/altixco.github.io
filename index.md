---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
title: Introduction 💻
---

# Introduction 💻

**Altix** is a Software Development Company focused on developing custom software using modern technologies and methodologies.

We try to keep our knowledge up to the latest trends. Focusing on quality for the sake of customer satisfaction.

We develop Software for companies from Europe, United States, and also Colombia. We believe in our Worldwide class capabilities due to our experience. Therefore we value compromise, quality, and good communication both in Spanish and English.

- See: [Altix Presentation](/assets/pdf/PresentationAltixSAS.pdf){:target="_blank"}

# Links

## ![](/assets/img/altix.png) Website:
[http://altix.co/](http://altix.co/){:target="_blank"}

## ![](/assets/img/github.png) Github:
[https://github.com/altixco/](https://github.com/altixco/){:target="_blank"}

## ![](/assets/img/instagram.ico) Instagram:
[https://www.instagram.com/altix.co](https://www.instagram.com/altix.co){:target="_blank"}

## ![](/assets/img/facebook.ico) Facebook:
[https://www.facebook.com/altix.co](https://www.facebook.com/altix.co){:target="_blank"}

# Principles

## 1. Don't Repeat Yourself

Don't repeat yourself (`DRY`) is a principle of software development aimed at reducing repetition of software patterns, replacing it with abstractions or using data normalization to avoid redundancy.

As a general rule, if you find yourself copying and pasting code, or repeating it in a similar manner, don't do that. Either create a `Function`, a `Class`, a `Module`, or some kind of `Abstraction`.

## 2. Keep it simple. Stupid!

`KISS`, an acronym for "keep it simple, stupid", is a design principle noted by the U.S. Navy in 1960. The KISS principle states that most systems work best if they are kept simple rather than made complicated; therefore, simplicity should be a key goal in design, and unnecessary complexity should be avoided.

We always recommend you to look for the most simple and succinct way of doing something, rather than doing something complex or writing tons of lines of code that can be summarized in just a small number of lines.

This principle should not conflict with the first one, sometimes a feature would only be used once, therefore an abstraction won't be needed, and sometimes the feature would be used multiple times, then the first principle applies in that case.

## 3. Quality over quantity.

We don't care if you write a lot of lines of code, that's not an indicator of hard work, we rather prefer a `quality code` that resolves the problems while being concise.

### Example:

**Bad:**
```python
# Returns the factorial of a number
def function(a):
  res = 1
  for val in range(1, a + 1):
    res = res * val
  return res
```

**Good:**
```python
def factorial(number):
  return reduce(lambda n, current_product: n * current_product, range(1, number + 1))
```

> **Note** that a good code is self-documenting, in the first method the comment was required because the name of the method didn't inform what it does, in the Good code the method itself informs that it returns the factorial of a number, and it also accomplishes the same in a single line of code.

> **However**, it doesn't mean all the code should not be documented, documentation is important and required in a lot of cases.


# Next

- [Getting Started](/getting-started/)
