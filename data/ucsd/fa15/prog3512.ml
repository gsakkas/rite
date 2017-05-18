
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let x = (h * i) mod 10 in
      let k = (h * i) / 10 in
      if k = 0 then k + (mulByDigit i t) else [x] @ (k + (mulByDigit i t));;
