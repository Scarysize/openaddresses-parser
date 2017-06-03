# Parse Open Addresses CSVs

Retrieve the longitude and latitude values from a openaddresses CSV:

**Input**
```
-74.1507325,4.6651764,15B 15,,,,,,,,3f2bcf29569338db
-74.1507124,4.6652267,15B 21,,,,,,,,c1bde1886793d721
```

**Ouput**
```
-74.1507325,4.6651764
-74.1507124,4.6652267
```

## Build

```sh
corebuild src/openaddresses_parser.native
```

## Usage

```sh
./openaddresses_parser.native <input> -o <ouput>
```

## Bench

| Implementation | Number of lines | Runtime | Memory |
| -------------- | --------------- | ------- | ------ |
| ocaml.native   | 14151355        | 12.474s | ~7.6MB |
| ocaml.byte     | 14151355        | 49.444s | ~8.8MB |
| node.js        | 14151355        | 38.721s | ~44MB  |

