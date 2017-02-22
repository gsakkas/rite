(* This is copied from Jane Street's Core library, and extended by
 *   - TODO
 *)

module type Basic = sig 
  type 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
  val return : 'a -> 'a t
end

module type Infix = sig
  type 'a monad

  (** [t >>= f] returns a computation that sequences the computations
      represented by two monad elements.  The resulting computation first does
      [t] to yield a value [v], and then runs the computation returned by [f v].
  *)
  val (>>=) : 'a monad -> ('a -> 'b monad) -> 'b monad

  val (>>) : unit monad -> 'a monad -> 'a monad

  (** [t >>| f] is [t >>= (fun a -> return (f a))]. *)
  val (>>|) : 'a monad -> ('a -> 'b) -> 'b monad
end

module type S = sig
  (** A monad is an abstraction of the concept of sequencing of computations.
      A value of type 'a monad represents a computation that returns a value
      of type 'a. *)
  include Infix

  module Monad_infix : Infix with type 'a monad = 'a monad

  (** [bind t f] = [t >>= f] *)
  val bind : 'a monad -> ('a -> 'b monad) -> 'b monad
    
  (** [return v] returns the (trivial) computation that returns v. *)
  val return : 'a -> 'a monad

  (** [map t ~f] is t >>| f. *)
  val map : 'a monad -> f:('a -> 'b) -> 'b monad

  (** [join t] is [t >>= (fun t' -> t')]. *)
  val join : 'a monad monad -> 'a monad

  (** [ignore t] = map t ~f:(fun _ -> ()). *)
  val ignore : 'a monad -> unit monad

  (** [unit] = [return ()] *)
  val unit : unit monad

  val accumulate : ('a monad) list -> 'a list monad
end

(* CRv2 tvaroquaux: It seems that having an module for monads with two type
   parameters (e.g. the result monad) would make sense. I would tend to think
   that unifying the second parameter would cater to most of our needs but
   I have no data to back this claim.
*)


module Make (M : Basic) : S with type 'a monad = 'a M.t = struct

  let bind = M.bind

  let return = M.return
    
  module Monad_infix = struct
    type 'a monad = 'a M.t
    
    let (>>=) = bind

    let (>>) m n = m >>= (fun () -> n)

    let (>>|) t f = t >>= (fun a -> return (f a))
  end

  include Monad_infix

  let join t = t >>= (fun t' -> t')

  let map t ~f = t >>| f

  let ignore t = map t ~f:(fun _ -> ())

  let unit = return ()

  let rec accumulate = function
    | [] -> return []
    | m :: rem ->
        m >>= fun h ->
        accumulate rem >>= fun t ->
        return (h :: t)
end
