# Notes

## Section 4 

### Explain GOAL in ENGLISH


### TYPES 

  type DataSet     = [(e, e)]
  type EMap a      = E :-> a
  type TMap a      = T :-> a  

### Explain the GOAL in TYPES 
   
  predictTemplate : Features -> DataSet -> [T] -> E -> EMap (C, TMap C)

### Strategy 

  Explain three steps: extractT, trainT, predictT in english and show types 
 
- extractT : [Feature] -> [T] -> (E, E) -> EMap (V, B, TMap B)
- trainT   : [(V, B, TMap B)] -> Model 
- predictT : Model -> V -> (C, TMap C)

### Explain extractT 

### Explain trainT 

### Explain predictT

### Putting it all into `predictTemplate`  

```
predictTemplate features dataset templates 
  let 
    model = trainT . concatMap (extractT features templates) $ dataset
  in
    \e -> [e' :-> let (v,_,_) = extractT features templates (e, e) 
                  predictT model v ]  
```
## Using the MODEL to Predict
