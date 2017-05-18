
let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> let x = h * i in x :: (mulByDigit i t);;

let multHelper i l =
  match l with
  | [] -> []
  | h::t ->
      let x = h * i in
      (match x with
       | x when x >= 10 -> (x / 10) @ ((x mod 10) + (mulByDigit i t))
       | _ -> x :: (mulByDigit i t));;
