LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))
let foo =
  fun b ->
    (let result = f b in
     if result = b
     then (result , false)
     else (result , true)) in
wwhile (foo , b)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
let funt =
  fun x -> (f b , f b = b) in
wwhile (funt , b)
let fs =
  fun x -> (f b , f b = b) in
wwhile (fs , b)
let gs =
  fun x ->
    (let isFPoint =
       fun x -> (f x - x) < 0 in
     (x , isFPoint x)) in
wwhile (gs , b)
let fix =
  fun l ->
    fun x -> List.map f l in
sepConcat "[" l
let g =
  fun x ->
    (let n = f x in
     (n , n = x)) in
wwhile (g , b)
let f' =
  fun b' ->
    (f b' , f b' <> b') in
wwhile (f' , b)
let helper =
  fun b ->
    if f b = b
    then (true , f b)
    else (false , f b) in
wwhile (helper , b)
let helper =
  fun b ->
    if f b = b
    then (b , false)
    else (f b , true) in
wwhile (helper , b)
