LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let max' =
  fun a ->
    fun b ->
      if a > b then a else b in
let my_log =
  fun l' ->
    (let l = max' 0.1 l' in
     log l /. log 10.0) in
if eval (c , x , y) < 0.0
then (my_log (a *. 100.0) ** sin ((pi *. b) *. 100.0)) -. 1.0
else (- 1.0) *. ((my_log (b *. 100.0) ** (pi *. sin (a *. 100.0))) -. 1.0)
let f =
  fun a -> fun x -> a * a in
let base =
  match xs with
  | [] -> 4
  | hd :: tl -> f (f 2 hd) tl in
List.fold_left f base xs
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
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
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
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let getTail =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> t in
let getCarry =
  fun (c , l) -> c in
let carry = getCarry a in
let getSum =
  fun (c , l) -> l in
let sum =
  if carry = 1
  then getTail (getSum a)
  else getSum a in
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
let getCarry =
  fun (c , l) -> c in
let carry = getCarry a in
let getSum =
  fun (c , l) -> l in
let sum =
  if carry = 1
  then getTail (getSum a)
  else getSum a in
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
let getSum =
  fun (c , l) -> l in
let sum =
  if carry = 1
  then getTail (getSum a)
  else getSum a in
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
let g =
  fun a ->
    fun x -> a ^ ("; " ^ f x) in
let base = "[" ^ f x in
List.fold_left g base xs ^ "]"
let g =
  fun a ->
    fun x -> a ^ ("; " ^ f x) in
let base = "[" ^ f x in
List.fold_left g base xs ^ "]"
let g =
  fun a ->
    fun x -> a ^ ("; " ^ f x) in
let base = "[" ^ f x in
List.fold_left g base xs ^ "]"
let g =
  fun a ->
    fun x -> a ^ ("; " ^ f x) in
let base = "[" ^ f x in
List.fold_left g base xs ^ "]"
