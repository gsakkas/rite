
let listReverse l =
  let rec recurse x xs =
    match x with | [] -> [] | hd::tl -> (recurse tl hd) :: xs in
  recurse l [];;
