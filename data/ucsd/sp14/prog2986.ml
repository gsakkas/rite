
let bigMul l1 l2 =
  let f a x =
    match x with
    | (addend_a,addend_b) ->
        let prevcarry = match a with | (x,y) -> x in
        let new_carry = ((prevcarry + addend_a) + addend_b) / 10 in
        let digit = ((prevcarry + addend_a) + addend_b) mod 10 in
        (match a with
         | (x,c::d::y) -> (new_carry, (new_carry :: digit :: d :: y))
         | _ -> (new_carry, [new_carry; digit])) in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> []
      | hd::tl -> if tl = [] then [(x, hd)] else (x, hd) :: (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;

let _ = bigMul [9; 9; 9; 9; 9] [9; 9; 9; 9; 9];;
