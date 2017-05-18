
let rec digitsOfInt n =
  let rec loop n acc =
    if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
  match n with | 0 -> [0] | _ -> loop n [];;

let _ = digitsOfInt - 2;;
