let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone x (n - 1))

let padZero =
  fun l1 ->
    fun l2 ->
      (let ll1 = List.length l1
       and ll2 = List.length l2 in
       if ll1 > ll2
       then (l1 , clone 0
                        (ll1 - ll2) @ l2)
       else (clone 0
                   (ll2 - ll1) @ l1 , l2))

let rec removeZero =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> if h = 0
                then removeZero t
                else l

let bigAdd =
  fun l1 ->
    fun l2 ->
      (let add =
         fun (l1 , l2) ->
           (let f =
              fun a -> fun x -> a in
            let base = (0 , []) in
            let args =
              List.combine l1 l2 in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone x (n - 1))

let padZero =
  fun l1 ->
    fun l2 ->
      (let ll1 = List.length l1
       and ll2 = List.length l2 in
       if ll1 > ll2
       then (l1 , clone 0
                        (ll1 - ll2) @ l2)
       else (clone 0
                   (ll2 - ll1) @ l1 , l2))

let rec removeZero =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> if h = 0
                then removeZero t
                else l

let bigAdd =
  fun l1 ->
    fun l2 ->
      (let add =
         fun (l1 , l2) ->
           (let f =
              fun a -> fun x -> __var_1__ in
            let base = (0 , []) in
            let args =
              List.combine l1 l2 in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone x (n - 1))

let padZero =
  fun l1 ->
    fun l2 ->
      (let ll1 = List.length l1
       and ll2 = List.length l2 in
       if ll1 > ll2
       then (l1 , clone 0
                        (ll1 - ll2) @ l2)
       else (clone 0
                   (ll2 - ll1) @ l1 , l2))

let rec removeZero =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> if h = 0
                then removeZero t
                else l

let bigAdd =
  fun l1 ->
    fun l2 ->
      (let add =
         fun (l1 , l2) ->
           (let f =
              fun a ->
                fun x -> (__var_1__ , l2) in
            let base = (0 , []) in
            let args =
              List.combine l1 l2 in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))


(* -------------------------------------- *)


(* bad

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = "" in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* student fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (cin,res) = a
      and (d1,d2) = x in
      ((((cin + d1) + d2) mod 10), (((cin + d1) + d2) :: res)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans

(16,17)-(16,19)
let (cin , res) = a
and (d1 , d2) = x in
(((cin + d1) + d2) mod 10 , ((cin + d1) + d2) :: res)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG),(TuplePatG (fromList [EmptyPatG]),VarG)] (TupleG [EmptyG,EmptyG])

*)
