LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG
let foo =
  fun b ->
    (let result = f b in
     if result = b
     then (result , false)
     else (result , true)) in
wwhile (foo , b)
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
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
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
EMPTY
let fix =
  fun l ->
    fun x -> List.map f l in
sepConcat "[" l
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
let f' =
  fun b ->
    if f b = b
    then (b , true)
    else (f b , false) in
f'
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
let f' =
  fun b -> (f b , b = f b) in
f'
let h =
  fun x -> (f x , f x = x) in
(h , b)
let g =
  fun b ->
    (let xx = f b in
     if b = xx
     then (xx , false)
     else (xx , true)) in
g
let g =
  fun x ->
    (let n = f x in
     (n , n = x)) in
wwhile (g , b)
let func = fun y -> x (a y) in
func
let func = fun y -> y in func
let combine =
  fun (a , b) -> a + b in
List.map combine
         (List.rev (List.combine l1
                                 l2))
let f' =
  fun b' ->
    (f b' , f b' <> b') in
wwhile (f' , b)
let g =
  fun x ->
    match f x with
    | x -> (x , false)
    | y -> (y , true) in
(g , b)
let helper =
  fun b ->
    if f b = b
    then (true , f b)
    else (false , f b) in
wwhile (helper , b)
let g =
  fun x ->
    (let calcfx = f x in
     (calcfx , calcfx = x)) in
(g , b)
let g =
  fun x ->
    (let calcx = f x in
     (calcx , calcx = x)) in
(g , b)
let f' =
  fun x -> (f x , f x = x) in
f'
let helper =
  fun b ->
    if f b = b
    then (b , false)
    else (f b , true) in
wwhile (helper , b)
let c = fun y -> x (a y) in c
let g = fun y -> y in g
