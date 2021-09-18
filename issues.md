#Issues

- I think there is an issue with track creation not searching for existing record before adding it to the db.
- The .tracks method on tracklist should be abstracted. I don't like how it's working right now.

#TODOs

- There sould be some avoiding N+1 queries int he serializers so they don't query and give back everything they need.
- What models are responsible for creating other models. There should be only a few point pieces.
