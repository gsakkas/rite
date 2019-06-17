LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])
let helper =
  fun x ->
    if b = f b
    then (b , false)
    else (b , true) in
wwhile (helper , b)
let helper =
  fun x ->
    if x = f x
    then (x , false)
    else (f x , true) in
wwhile (helper , b)
let d =
  fun x ->
    (let xx = f b in
     (xx , xx = b)) in
d
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
let w =
  fun b' ->
    (let fb = f b' in
     (fb , fb = b')) in
wwhile (w , b)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
(g , b)
let g =
  fun x ->
    (let bb = f b in
     (bb , bb = b)) in
(g , b)
let max' =
  fun a ->
    fun b ->
      if a < b then b else a in
max' 1.0 (min 1.0
              ((2.71 ** ((sin (pi *. eval (a , x , y)) +. cos (pi *. eval (b , x , y))) -. 1.0)) -. 1.0))
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
let h =
  fun x -> (f x , false) in
(h , b)
let xxx =
  fun n ->
    match n with
    | 0 -> []
    | n -> if n < 0
           then []
           else (n mod 10) :: (digitsOfInt (n / 10)) in
listReverse (xxx n)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
let whilesFun =
  fun f' ->
    fun b' ->
      (let fOfB = f' b' in
       (fOfB , fOfB = b')) in
whilesFun f
let f =
  fun a ->
    fun x ->
      (let (i , j) = x in
       let (s , t) = a in
       (((i * j) + s) / 10 , (((i * j) + s) mod 10) :: t)) in
let base = (0 , []) in
let args =
  List.combine (List.rev (0 :: l1))
               (List.rev (clone (List.length l)
                                i)) in
let (_ , res) =
  List.fold_left f base args in
res
let g = fun b -> (b , f b) in
wwhile (g , b)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
let prevN =
  fun (n1 , n2) -> n1 in
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let f =
  fun b -> (f b , b = f b) in
wwhile (f , b)
let f =
  fun b -> (f b , f b = b) in
wwhile (f , b)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
let f =
  fun b ->
    (let b' = f b in
     (b' , f b <> b)) in
wwhile (f , b)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
let func =
  fun x ->
    fun x ->
      (f b , not (f b = b)) in
(func b , b)
