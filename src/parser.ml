open Stream
open Helper
open Printf

module type Parser = sig
  val parse : string -> string -> unit
end

module Parser = struct
  let expr = Str.regexp "[A-Z0-9\.\-]+,[A-Z0-9\.\-]+"

  let exec_match line = 
    let matched = Str.string_match expr line 0 in
    ();;

  let parse_line line on_line_parse =
    exec_match line;
    on_line_parse ((Str.matched_string line) ^ "\n");;

  let process_lines lines on_line_parse =
    Stream.iter (fun line -> parse_line line on_line_parse) lines;;

  let process_file filename on_line_parse =
    let input_channel = open_in filename in
    try
      process_lines (Helper.line_stream_of_channel input_channel) on_line_parse;
      close_in input_channel
    with e ->
      close_in input_channel;
      raise e;;

  let parse input on_line_parse =
    process_file input on_line_parse;;
end

