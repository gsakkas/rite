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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     toSum)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
             then (l1 , listZeros @ l1)
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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     toSum)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     l2)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     l1)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
             then (l1 , listZeros @ listZeros)
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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     toSum)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     currList)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
             then (l1 , listZeros @ __var_1__)
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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     toSum)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     __var_1__)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = intermediateSum in
              (padCount - 1 , bigAdd currList
                                     intermediateSum)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
                  (let (_ , currentCarry :: currentSum) =
                     a in
                   let (toSum1 , toSum2) = x in
                   let intermediateValue =
                     (toSum1 + toSum2) + currentCarry in
                   let valueToAddToArray =
                     intermediateValue mod 10 in
                   let carry =
                     intermediateValue / 10 in
                   (carry , carry :: (valueToAddToArray :: currentSum))) in
            let base = (0 , [0]) in
            let args =
              List.rev (List.combine l1
                                     l2) in
            let (_ , res) =
              List.fold_left f base args in
            res) in
       removeZero (add (padZero l1
                                l2)))

let rec mulByDigit =
  fun i ->
    fun l ->
      if i <= 0
      then []
      else bigAdd l
                  (mulByDigit (i - 1) l)

let bigMul =
  fun l1 ->
    fun l2 ->
      (let f =
         fun a ->
           fun x ->
             (let (padCount , currList) =
                a in
              let intermediateSum =
                mulByDigit x l2 in
              let toSum = currList in
              (padCount - 1 , bigAdd currList
                                     toSum)) in
       let base = (0 , []) in
       let args = l1 in
       let (_ , res) =
         List.fold_left f base args in
       res)


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
      let (_,currentCarry::currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + currentCarry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (carry :: valueToAddToArray :: currentSum)) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (padCount,currList) = a in
    let intermediateSum = mulByDigit x l2 in
    let toSum = intermediateSum * (10 ** padCount) in
    ((padCount - 1), (bigAdd currList toSum)) in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

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
      let (_,currentCarry::currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + currentCarry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (carry :: valueToAddToArray :: currentSum)) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (padCount,currList) = a in
    let intermediateSum = mulByDigit x l2 in
    let rec generatePadding numZeros =
      if numZeros <= 0 then [] else 0 :: (generatePadding (numZeros - 1)) in
    let toSum = intermediateSum @ (generatePadding padCount) in
    ((padCount + 1), (bigAdd currList toSum)) in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans

(37,5)-(38,46)
let rec generatePadding =
  fun numZeros ->
    if numZeros <= 0
    then []
    else 0 :: (generatePadding (numZeros - 1)) in
let toSum =
  intermediateSum @ generatePadding padCount in
(padCount + 1 , bigAdd currList
                       toSum)
LetG Rec [(VarPatG,LamG EmptyPatG EmptyG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)
