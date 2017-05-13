
let bigAdd = failwith "TBD";;

let rec mulByDigit i l = if i <> 0 then mulByDigit (i - 1) bigAdd l l else l;;
