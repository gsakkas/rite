
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n acc =
       if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
     match n with | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  let rec loop retVal =
    if retVal < 10 then retVal else loop sumList (digitsOfInt retVal) in
  match n with | 0 -> 0 | _ -> loop n;;
