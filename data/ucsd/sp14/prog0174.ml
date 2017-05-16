
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t -> ((h * i) mod 10) :: (((h * i) / 10) + (m * i));;
