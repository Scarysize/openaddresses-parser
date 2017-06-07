open Stream
open StreamHelper
open Printf

let expr = Str.regexp "[A-Z0-9\\.-]+,[A-Z0-9\\.-]+"

let execute_match line = Str.string_match expr line 0;;

let parse_line line =
  match execute_match line with
  | true -> Some ((Str.matched_string line) ^ "\n")
  | false -> None;;

let process_lines lines on_line_parse =
  let on_parse = (fun line -> 
      let parsed_line = parse_line line in
      match parsed_line with
      | Some line  -> on_line_parse line
      | None -> ()) in
  Stream.iter on_parse lines;;

let process_file filename on_line_parse =
  let input_channel = open_in filename in
  try
    process_lines (StreamHelper.line_stream_of_channel input_channel) on_line_parse;
    close_in input_channel
  with e ->
    close_in input_channel;
    raise e;;

module type ParserType = sig
  val parse : string -> (string -> unit) -> unit
end

module Parser : ParserType = struct
  let parse input_file on_line_parse = 
    process_file input_file on_line_parse
end
