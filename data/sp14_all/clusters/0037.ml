LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG
let d =
  fun x ->
    (let xx = f b in
     (xx , xx = b)) in
d
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
