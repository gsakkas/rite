
let rec mulByDigit i l =
  match List.rev l with
  | []::[] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;
