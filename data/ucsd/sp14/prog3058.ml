
let rec mulByDigit i l =
  let rec helper acc carry i l =
    match l with
    | [] -> (match acc with | [] -> [] | h::t -> if h = 0 then t else acc)
    | h::t ->
        let x = (h * i) + carry in
        let n = if x > 9 then x mod 10 else x in
        let carry' = if x > 9 then x / 10 else 0 in
        let acc' = n :: acc in helper acc' carry' i t in
  helper [] 0 i (List.rev (0 :: l));;

let bigMul l1 l2 =
  let f a x = a in
  let base = failwith "to be implemented" in
  let args =
    let rec digitProducts acc place l1 l2 =
      match l1 with
      | [] -> acc
      | h::t ->
          let placeHolders =
            let rec buildZeros a places =
              if places = 0 then a else buildZeros (0 :: a) (places - 1) in
            buildZeros [] place in
          let a = List.append (mulByDigit h l2) placeHolders in
          (digitProducts a) :: (acc (place + 1) t l2) in
    digitsProducts [] 0 l1 l2 in
  let (_,res) = List.fold_left f base args in res;;
