
let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (n mod 10) :: (helper (n / 10)) in
  let rec reverse xs =
    match xs with | [] -> [] | hd::tl -> (reverse tl) :: hd in
  reverse (helper n);;
