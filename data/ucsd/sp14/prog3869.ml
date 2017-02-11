
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let mulByDigit i l =
  let rec helpy p q carry accList =
    let numsList = List.rev q in
    match numsList with
    | [] -> accList
    | h::t ->
        let initMul = (h * p) + carry in
        let intKeep = initMul mod 10 in
        let carrying = (initMul - intKeep) mod 100 in
        let v = List.rev t in (helpy p v carrying accList) @ intKeep in
  removeZero (list.rev (helpy i l 0 [(0, 0)]));;
