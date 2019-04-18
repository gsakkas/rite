LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))
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
let max' =
  fun a ->
    fun b ->
      if a < b then b else a in
max' 1.0 (min 1.0
              ((2.71 ** ((sin (pi *. eval (a , x , y)) +. cos (pi *. eval (b , x , y))) -. 1.0)) -. 1.0))
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
let whilesFun =
  fun f' ->
    fun b' ->
      (let fOfB = f' b' in
       (fOfB , fOfB = b')) in
whilesFun f
let g = fun b -> (b , f b) in
wwhile (g , b)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
let f =
  fun b -> (f b , b = f b) in
wwhile (f , b)
let f =
  fun b -> (f b , f b = b) in
wwhile (f , b)
let f =
  fun b ->
    (let b' = f b in
     (b' , f b <> b)) in
wwhile (f , b)
let helper =
  fun x ->
    fun n ->
      if n < 1
      then accum
      else x :: accum in
helper x (n - 1)
let mult =
  fun i ->
    fun l ->
      (let f =
         fun a ->
           fun x ->
             (let (carryOver , rest) = a in
              let num =
                carryOver + (x * i) in
              let secondDigit =
                num mod 10 in
              let carryOver = num / 10 in
              let result =
                secondDigit :: rest in
              (carryOver , rest)) in
       let base = (0 , []) in
       let (carryOver , rest) =
         List.fold_left f base
                        (List.rev l) in
       carryOver :: rest) in
removeZero (mult i l)
