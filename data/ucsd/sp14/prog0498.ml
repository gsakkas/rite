
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs2 with | [] -> xs1 | hd::tl -> append (xs1 :: hd) tl in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;
