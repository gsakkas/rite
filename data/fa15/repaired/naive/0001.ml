let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone x (n - 1))

let padZero =
  fun l1 ->
    fun l2 ->
      (let numZeros =
         List.length l1 - List.length l2 in
       let absNumZeros =
         abs numZeros in
       if numZeros = 0
       then (l1 , l2)
       else (let listZeros =
               clone 0 absNumZeros in
             if numZeros > 0
             then (l1 , listZeros @ l2)
             else (listZeros @ l1 , l2)))

let rec removeZero =
  fun l ->
    match l with
    | [] -> []
    | 0 :: t -> removeZero t
    | h :: t -> l

let bigAdd =
  fun l1 ->
    fun l2 ->
      (let add =
         fun (l1 , l2) ->
           (let f =
              fun a ->
                fun x ->
                  (let (carry , currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + carry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , __var_1__ @ currentSum)) in
            let base = (0 , []) in
            let args = __var_1__ in
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
      (let numZeros =
         List.length l1 - List.length l2 in
       let absNumZeros =
         abs numZeros in
       if numZeros = 0
       then (l1 , l2)
       else (let listZeros =
               clone 0 absNumZeros in
             if numZeros > 0
             then (l1 , listZeros @ l2)
             else (listZeros @ l1 , l2)))

let rec removeZero =
  fun l ->
    match l with
    | [] -> []
    | 0 :: t -> removeZero t
    | h :: t -> l

let bigAdd =
  fun l1 ->
    fun l2 ->
      (let add =
         fun (l1 , l2) ->
           (let f =
              fun a ->
                fun x ->
                  (let (carry , currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + carry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , __var_1__)) in
            let base = (0 , []) in
            let args = __var_1__ in
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
      (let numZeros =
         List.length l1 - List.length l2 in
       let absNumZeros =
         abs numZeros in
       if numZeros = 0
       then (l1 , l2)
       else (let listZeros =
               clone 0 absNumZeros in
             if numZeros > 0
             then (l1 , listZeros @ l2)
             else (listZeros @ l1 , l2)))

let rec removeZero =
  fun l ->
    match l with
    | [] -> []
    | 0 :: t -> removeZero t
    | h :: t -> l

let bigAdd =
  fun l1 ->
    fun l2 ->
      (let add =
         fun (l1 , l2) ->
           (let f =
              fun a ->
                fun x ->
                  (let (carry , currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + carry in
                   __var_1__) in
            let base = (0 , []) in
            let args = __var_1__ in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))


(* -------------------------------------- *)


(* bad

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | h::t -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + carry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (valueToAddToArray @ currentSum)) in
    let base = (0, []) in
    let args = List.rev List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* student fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | h::t -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + carry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (valueToAddToArray :: currentSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans

(24,15)-(24,47)
valueToAddToArray :: currentSum
AppG [VarG,VarG]

(26,16)-(26,43)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

*)
