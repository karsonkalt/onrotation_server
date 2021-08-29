# Developer Notes
## Project Approach
1. Encorcing db constraints as well as model validations.
    1. This will help if there are multiple requests being made to the back end in rapid succession. There is a chance that the model would not catch the validation and cause issues with the model. This is not 'DRY' but is required for high traffic applications and part of rails/ActiveRecord gap.
2. How I decided to work on the project
    1. I spent a lot of time figuring out what project I wanted to go after and wanted to consider if it was easy to understand for my portfolio. I went back and forth between this and a workout app and decided on this because I really could get into the problem solving and not just re-hash a project that has been done a lot of times. My worry was that electronic music is too complex for someone to quickly understand, so it was a risk going in this direction. But I had faith that I could simplify and make these complex issues easy to understrand and to use.
    2. I started designing the project drawing in a notebook, refining how I wanted features to work and look. I made notes and drew out ideas to icons and to reusable Components.
    3. I then made a wireframe of how it would look and function in Adobe XD.
        1. I cut out things that felt extra.
        2. This helped me figure out exactly how data would talk to each other, especially because part of the core function of the app is filling in missing data.
    4. I reworked some icons that I wanted to use so that as I created the back end, I would have proper names for how buttons would work.
        1. For example, instead of bookmark, I started with a "eye" icon to watch the track, but it didn't seem exciting enough to be used. I then thought about a star or a heart, but that seemed to imply a "like" rather than "let me know when someone figures out what this track is." I settled on a bookmark with a star on it because it implies it is a "favorite" and also "come back to this later".
        2. This impacted how I named things on the back end and in my migrations and models.
    5. I then drew out my schema in drawio and wrote the data types and the validations as well as requirements.
        1. This really helped me think about how things would be enforeced and relate to each other.
    6. I then started building my models and migrations, models, and building relationships as well as db constraints, then model validations.
    7. I wrote seed files while working on ensuring validations/constraints and relationships were being handled propertly in rails console. I stayed in this phase for a while to make sure everything was working.


## Learnings
1. Ran into issue with constraint enforcement with ActiveRecord. We could not resolve even with a TC so we changed hash notation from `key: value` to `:key => value`. The db started to enforce uniqueness and null constrains on the next migration.
2. Adding indexing to columns for faster searching. Because SQL is SLOW.
3. Add CLI feedback to the seed file because I am working so much on constraints and relationships and getting the db working properly.