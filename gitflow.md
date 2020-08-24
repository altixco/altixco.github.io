---
layout: default
title: Gitflow 🖇️
permalink: /gitflow/
---

# Gitflow 🖇️

Gitflow is our preferred way of collaborating and managing code versions.

![](/assets/img/gitflow.png)

Our branching model is based on **Gitflow**, the variation is present in the `release` and `hotfix` branches because of the requirement of supporting two versions of the system, here are the details of the branches:

## GIT

Gitflow is the workflow, but Git is the tool, in case you don't have experience with Git, here is an useful that explains the basics:

<iframe width="100%" height="400px" style="margin-bottom: 20px" src="https://www.youtube.com/embed/hwP7WQkmECE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## The **Master** branch
The HEAD of the `master` branch should always reflect a production-ready state, the latest commit of this branch reflects the current state of the production environment.

## The **Develop** branch
The `develop` branch is the main branch with the latest delivered development changes, all the other support branches branch off from `develop` and merged back to `develop` through *pull requests*.

## Supporting branches

### **Feature** branches

Must branch off from:
- `develop`

Must merge back into:
- `develop`

Naming convention:
- `feature/*` or anything except `master`, `develop`, `release`, `hotfix`, `fix`.

Feature branches are used to develop new features, configurations, or even refactors, the name of these branches may be for instance config/my-config refactor/my-refactor, or just feature/my-config or refactor/my-refactor.

### **Release** branches

May branch off from:
- `master` or `develop`.

Must merge back into:
- `master` and/or `develop` depending of the release.

Naming convention:
- `release/*`

It contains the state of the major releases, example `release/v1.0`, and `release/v2.0`.

### **Fix** branches

May branch off from:
- `master` or `develop`.

Must merge back into:
- If branched off from `master` should be merged back to `master` and `develop`. 
- If merge from `develop` should be merged back to `develop`.

Naming convention:
- `fix/*` or `hotfix/*`

The `fix` branches are used for solving bugs, doing small improvements, or solving small configuration issues, they are branched off from `develop`, and the `hotfix` branches are used to solve bugs or issues that should be fixed immediately in production, then those branches usually branch off from `master`.

## See:

- <https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow>

# Next

- [Stack](/stack/)
