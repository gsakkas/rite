let rec removeZero =
  fun l ->
    match __var_1__ with
    | [] -> []
    | h :: t -> if h = 0
                then removeZero t
                else l

let rec mulByDigit =
  fun i ->
    fun l ->
      (let rec helper =
         fun acc ->
           fun cin ->
             fun l' ->
               match l' with
               | [] -> cin :: acc
               | h :: t -> (let sum =
                              (i * h) + cin in
                            helper ((sum mod 10) :: acc)
                                   (sum / 10) t) in
       removeZero (helper [] 0 l))

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x -> mulByDigit x l1 in
       let base = [] in
       let args = l2 in
       removeZero __lit__)


(* -------------------------------------- *)

let rec removeZero =
  fun l ->
    match __var_1__ with
    | [] -> []
    | h :: t -> if h = 0
                then removeZero t
                else l

let rec mulByDigit =
  fun i ->
    fun l ->
      (let rec helper =
         fun acc ->
           fun cin ->
             fun l' ->
               match l' with
               | [] -> cin :: acc
               | h :: t -> (let sum =
                              (i * h) + cin in
                            helper ((sum mod 10) :: acc)
                                   (sum / 10) t) in
       removeZero (helper [] 0 l))

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x -> mulByDigit x l1 in
       let base = [] in
       let args = l2 in __var_1__)


(* -------------------------------------- *)

let rec removeZero =
  fun l ->
    match __var_1__ with
    | [] -> []
    | h :: t -> if h = 0
                then removeZero t
                else l

let rec mulByDigit =
  fun i ->
    fun l ->
      (let rec helper =
         fun acc ->
           fun cin ->
             fun l' ->
               match l' with
               | [] -> cin :: acc
               | h :: t -> (let sum =
                              (i * h) + cin in
                            helper ((sum mod 10) :: acc)
                                   (sum / 10) t) in
       removeZero (helper [] 0 l))

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x -> mulByDigit x l1 in
       let base = [] in
       let args = l2 in
       removeZero ([] 0))


(* -------------------------------------- *)


(* bad

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let rec helper acc cin l' =
    match l' with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) t in
  removeZero (helper [] 0 l);;

let bigMul l1 l2 =
  let f a x = mulByDigit x l1 in
  let base = [] in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* student fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let rec helper acc cin l' =
    match l' with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) t in
  removeZero (helper [] 0 l);;

let bigMul l1 l2 =
  let f a x = (0, (mulByDigit x l1)) in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans

(14,15)-(14,30)
(0 , mulByDigit x l1)
TupleG [LitG,AppG [EmptyG,EmptyG]]

(15,14)-(15,16)
(0 , [])
TupleG [LitG,ListG []]

*)
