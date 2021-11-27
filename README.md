# vnuni

## _hệ thông thông tin địa lý về trường đại học ở VN_

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## POST /taikhoan/dangky

- request body:
  - username (required): string (5-32 letters, a-z, A-Z. 0-9, _, .)
  - password (required): string (5-32 letters, only contain non white space characters)
  - ho (optional): string
  - ten (required): string
- response:

```
{
    token: string
}
```

## POST /taikhoan/dangnhap

- request body:
  - username (required): string;
  - password (required): string; 
- response:

```
{
    token: string
}
```

## GET /truong

- request query params:
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
        ten_tinh: string,
        mo_ta: string,
        sao: number
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
                tenmien: string,
                mota: string,
                id_nhom: number,
                id_tinh: number,
                sao: number
            }
        }>

    }
}
```

## GET /truong/:id/danhgia

- response
```
{
    id_danh_gia: number,
    sao: number,
    danh_gia: string | null,
    created_at: date-string,
    username: string,
    ho: string | null,
    ten: "string",
    hinh_anh: Array<{
        id_hinh: number,
        url: string
    }>
}
```

## POST /truong (admin only)

- request headers:
  - Authorization: <token>
- request body (json):
  - ten_truong (required): string
  - coordinates (required): [number, number]
  - mo_ta (optional): string
  - id_nhom (optional): number
- response (geojson)

```
{
    id_truong: number,
    tentruong: string,
    mo_ta: string | null
    id_nhom: number | null,
    id_tinh: number,
}
```

## PUT /truong/:id (admin only)

- request headers:
  - Authorization: <token>
- request body (json) (at least 1 field):
  - ten_truong: string
  - coordinates: [number, number]
  - mo_ta: string
  - id_nhom: number
- response: NOTHING

## DELETE /truong/:id (admin only)

- request headers:
  - Authorization: <token>
- response: NOTHING

## POST /danhgia

- request headers:
  - Authorization: <token>
  - Content-Type: 'multipart/form-data'
- request body:
  - id_truong (required): number
  - sao (required): number (0-5)
  - danh_gia (optional): string
  - hinh_anh (optional): File | Array<File> (jpg, png only)
- response (geojson)

```
{
    id_danh_gia: number
    sao: number,
    danh_gia: string | null
    username: string,
    created_at: date-string,
    id_truong: number,
    hinh_anh: Array<{
        id_hinh: number,
        url: string,
        id_danh_gia: number
    }>,
}
```

## PUT /danhgia/:id (onwer only)

- request headers:
  - Authorization: <token>
- request body (at least one field):
  - sao: number (0-5)
  - danh_gia: string
- response: NOTHING

## DELETE /danhgia/:id (onwer only)

- request headers:
  - Authorization: <token>
- response: NOTHING

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

## GET /khac

```
{
    type: "FeatureCollection",
    features: Array<{
        type: "Feature",
        geometry: {
            type: "Point" | "Polygon" | "LineString",
            coordinates: ICoordinate<"Point" | "Polygon" | "LineString">
        },
        properties: {
            id: number,
            mota: string,
        }
    }>
}
```

## POST /khac (tạo)

- request body (json):
  - type (required): Point hoặc Polygon hoặc LineString
  - coordinates (required):
    - type = Point: [number, number]
    - type = LineString: Array<[number, number]>
    - type = Polygon: Array<Array<[number, number]>>
  - mota (optional): mô tả
- response:
```
{
    id: number,
    mota: string | null
}
```

## PUT /khac/:id (sửa)

- request body (json) (at least 1 property):
  - coordinates:
    - type = Point: [number, number]
    - type = LineString: Array<[number, number]>
    - type = Polygon: Array<Array<[number, number]>>
  - mota: mô tả
- response: NOTHING

## DELETE /khac/:id (xóa)
- response: NOTHING

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
