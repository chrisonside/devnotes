###Time Github Flow

IPC Flow is a proposed workflow for git projects. It is inspired by http://scottchacon.com/2011/08/31/github-flow.html which in turn is inspired by https://github.com/nvie/gitflow.
The reasoning behind it appears below. For tips on day to day working, look at the Howto.
There are also many articles to be found on rebase and merge this one does a good job of explaining why rebase is not to be feared.
A couple of teams have adapted this flow - mobile and leisure

##Issues with standard git flow

* Github operate with a continuous deployment methodology, while this is something we are working towards, realistically there needs to be QA / UAT before we can deploy.
* Github tend to have single developers working on features, we can have multiple developers working on the same feature
* However, despite these issues, we can still work in a similar way and benefit from a lot of advantages of this method, such as a stable master that is always ready for deployment, which means smaller features are not held up because a larger feature has been tested first.

##Workflow
* Anything in the master branch is deployable
* To work on something new, create a descriptively named branch off of master (ie: new-oauth2-scopes)
* Commit to that branch locally and regularly push your work to the same named branch on the server
* When you need feedback or help, or you think the branch is ready for merging, open a pull request
* After someone else has reviewed and signed off on the feature, you can merge it into master
* Once it is merged and pushed to ‘master’, it should be ready for release

Github claim this scales to 15 - 20 developers per team, which is larger than any of our teams, so shouldn't be a problem. Lets now look at each step in turn...

#####Anything in the master branch is deployable
From Github Flow -  
"This is basically the only hard rule of the system. There is only one branch that has any specific and consistent meaning and we named it master. To us, this means that it has been deployed or at the worst will be deployed within hours. It’s incredibly rare that this gets rewound (the branch is moved back to an older commit to revert work) - if there is an issue, commits will be reverted or new commits will be introduced that fixes the issue, but the branch itself is almost never rolled back.

The master branch is stable and it is always, always safe to deploy from it or create new branches off of it. If you push something to master that is not tested or breaks the build, you break the social contract of the development team and you normally feel pretty bad about it."
In our case, we wouldn't necessarily deploy the branch immediately due to UAT constraints, but it should have been through the full process and be ready for deployment.

#####To work on something new, create a descriptively named branch off of master (ie: dfp-updates)
From Github Flow -  
"When you want to start work on anything, you create a descriptively named branch off of the stable master branch. This has several advantages - one is that when you fetch, you can see the topics that everyone else has been working on. Another is that if you abandon a branch for a while and go back to it later, it’s fairly easy to remember what it was.
This is nice because when we go to the GitHub branch list page we can easily see what branches have been worked on recently and roughly how much work they have on them.

It’s almost like a list of upcoming features with current rough status. This page is awesome if you’re not using it - it only shows you branches that have unique work on them relative to your currently selected branch and it sorts them so that the ones most recently worked on are at the top. If I get really curious, I can click on the ‘Compare’ button to see what the actual unified diff and commit list is that is unique to that branch."

We would need to make a slight change to this workflow for the case of multiple devs working on one story - in this case it is best to have one branch for the story, on the main repository of the story, and each developer to have a fork of that branch. This will be explained more when we come to rebasing.

#####Commit to that branch locally and regularly push your work to the same named branch on the server
From Github Flow -  
"Another big difference from git-flow is that we push to named branches on the server constantly. Since the only thing we really have to worry about is master from a deployment standpoint, pushing to the server doesn’t mess anyone up or confuse things - everything that is not master is simply something being worked on.

It also make sure that our work is always backed up in case of laptop loss or hard drive failure. More importantly, it puts everyone in constant communication. A simple ‘git fetch’ will basically give you a TODO list of what every is currently working on."

It also lets everyone see, by looking at the GitHub Branch List page, what everyone else is working on so they can inspect them and see if they want to help with something."
We wouldn't need to make changes to this part

#####When you need feedback or help, or you think the branch is ready for merging, open a pull request
From Github Flow -  
"GitHub has an amazing code review system called Pull Requests that I fear not enough people know about. Many people use it for open source work - fork a project, update the project, send a pull request to the maintainer. However, it can also easily be used as an internal code review system, which is what we do.
Actually, we use it more as a branch conversation view more than a pull request. You can send pull requests from one branch to another in a single project (public or private) in GitHub, so you can use them to say “I need help or review on this” in addition to “Please merge this in”."

The github flow article goes into more detail over why pull requests are an excellent tool, not just for code review but whenever you need help on a feature or want some feedback.

make sure to rebase when ever a new feature gets added to master
Rebasing is a way of making sure your branch is up to date. There is a lot of FUD around rebasing, but it is safe to do if you don't share the changes with anyone. Rebasing ensures a linear history, and always makes it simple to merge back down to master.
In the case of multiple developers working on a feature, have an integration branch, which developers rebase from and merge into (with a fast forward merge). This integration branch is periodically rebased and developers will have to take a personal branch from it again
Another reason for doing this is to keep history looking nicer, and ensure git log --merges will just show pull request merges from a branch, and not lots of commits about bringing branches up to date with master.

#####When finished, rebase and add a pull request
This pull request should be signed off by someone within the team that is comfortable reviewing it. The reviewer should mark any issues they find in the inline comments in the pull request interface

####Resources
<http://randyfay.com/content/rebase-workflow-git>
<http://randyfay.com/node/103>
