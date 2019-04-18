LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
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
let g =
  fun b ->
    (let xx = f b in
     if b = xx
     then (xx , false)
     else (xx , true)) in
g
let func = fun y -> x (a y) in
func
let func = fun y -> y in func
let f' =
  fun x -> (f x , f x = x) in
f'
let c = fun y -> x (a y) in c
let g = fun y -> y in g
