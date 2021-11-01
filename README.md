# vnuni

## _hệ thông thông tin địa lý về trường đại học ở VN_

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## GET /truong

- query params:
  - truong: lọc theo tên trường.
  - nhom: lọc theo tên nhóm.
  - tinh: lọc theo tên tỉnh.
  - mien: lọc theo tên miền.
- response (geojson)

```
{
    data: Array<{
        id_truong: number,
        tentruong: string,
        lat: number,
        long: number,
        id_mien: number,
        ten_mien: string,
        id_nhom: number,
        ten_nhom: string,
        id_tinh: number,
        ten_tinh: string
    }>,
    geojson: {
        type: "FeatureCollection",
        features: Array<{
            type: "Feature",
            geometry: {
                type: "Point",
                coordinates: [number, number]
            },
            properties: {
                tentruong: string,
                tennhom: string,
                tentinh: string,
                tenmien: string
            }
        }>

    }
}
```

## GET /nhom

- response

```
Array<{
    id_nhom: number,
    ten_nhom: string
}>
```

## GET /tinh

- response

```
Array<{
    id_tinh: number,
    ten_tinh: string,
    id_mien: number
}>
```

## GET /mien

- response

```
Array<{
    id_mien: number,
    ten_mien: string,
}>
```

## License

MIT

**Free Software, Hell Yeah!**

[//]: # "These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax"
[dill]: https://github.com/joemccann/dillinger
[git-repo-url]: https://github.com/joemccann/dillinger.git
[john gruber]: http://daringfireball.net
[df1]: http://daringfireball.net/projects/markdown/
[markdown-it]: https://github.com/markdown-it/markdown-it
[ace editor]: http://ace.ajax.org
[node.js]: http://nodejs.org
[twitter bootstrap]: http://twitter.github.com/bootstrap/
[jquery]: http://jquery.com
[@tjholowaychuk]: http://twitter.com/tjholowaychuk
[express]: http://expressjs.com
[angularjs]: http://angularjs.org
[gulp]: http://gulpjs.com
[pldb]: https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md
[plgh]: https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md
[plgd]: https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md
[plod]: https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md
[plme]: https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md
[plga]: https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md
