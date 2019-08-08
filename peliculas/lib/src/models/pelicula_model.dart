class Peliculas {
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final pelicula = new Pelicula.fromJsonMap(item);
        items.add(pelicula);
      }
    }
  }
}

class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Pelicula({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json["vote_count"];
    id = json["id"];
    video = json["video"];
    voteAverage = json["vote_average"] / 1;
    title = json["title"];
    popularity = json["popularity"] / 1;
    posterPath = json["poster_path"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    genreIds = json["genre_ids"].cast<int>();
    backdropPath = json["backdrop_path"];
    adult = json["adult"];
    overview = json["overview"];
    releaseDate = json["release_date"];
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQMAAADCCAMAAAB6zFdcAAAARVBMVEX///+wsbHu8PH39/jy9PSsra2ys7PExcXv7+/s7Oz7+/uqq6u4ubnT1NTGx8e0tbXn5+fb29u8vb3U1dXMzc3h4eGkpaXPa21KAAAHrElEQVR4nO2di5qcKBBGIYDITS5Cv/+jbhVqXyadTTZr98xo/V+mnSitcgSqgMJhjETqsvLMsp2B+PHZ9/GJ+rEx+MxS+MkiBsQARQyIAYoYEAMUMSAGKGJADFDEgBigiAExQBEDYoAiBsQARQyIAYoYEAMUMSAGKGJADFDEgBigiAExQBEDYoAiBsQARQyIAYoYEAMUMSAGKGJADFDEgBigiMEXZSDHTfYdl/uKDGQZVvH0jut9RQZj5KsUMSAG52bAnepy7rQM7Bw2yXdc740MbNB/qOkqPb/BOr6RQVX8v0vV10N4H4Nx+AsEnA+vrw7vY2D+ksH48jsjBp/LoNu/MzNQFz+FPNfi3MN+d9XRGSg/i3W/beXuQGxbl9H4YzNQtbf20vQM2nw74q9mwBZ1YAbKgwssc+ntgQ8j9pbVEwZHLgcR8pk9NocDNowxWCb0uRhEw+yk1FDbKGSaAUYRTPi1CZzbqnzg9kBlZsFtnrYHLgJHCGarKFcd2C4U7DmocHckD0rDTv5Uh2TQmFGqPhzKWDjkeRhAsa8ufugMauXh4ywMoBLICE/9UWlwhrWnfvMRGWTWunF8VFEzG89SDgbDgis/jYtMamLSn4QBBwaXD2NDNbAZLMOpGcTCwqkYJDZ/qAsWLOWp6kJvEx/zNbvEPOw3zxAckkGF5w1G4KYUi03cSZbPYhuxYwg+0jaAwiD7agQfCTzo8gzBIRmoBl6xm/plbQvFeQNWAZqJ8fnQ4hEZcPCK57XDMC5jatBdmM7VZ8LGoDpXElxZQp0w0IsEQ9GeIzgmAzSPtirHNQ6fpjoopwUT8VwMMKogFe4uKKdiuw85OAkDjrkWbSqRR68zdKCM/+Vcy1EZgF3AnFk59lfayn+bkT4sA66GmhYfwZo5/tuE23EZQFFQvtRai+fuF7k/PgNOc65/LGJwMAbPhwt/z+BIsTgsOPXf5ebfn/j/6p2xefP0p8F5tyi9j6Pwr9BXjNF8t4gBMUARA2KAIgZfiIEYxe8TvUZvZJA8uL22dt+3LoszxLTOOKUyxKFITFQ8KLDWPQNZ2utv7J0MLgYuxDFTdpjXXUtvIKuY24whe81p6FHXzDJHJ1n+FKrwAr2TgQMGxmn89TL1XdrV5chWHoDB2kdqF0x4SAZN4RzTfOnTrqP3fcZJ82vH6MbA8XxQBnVQjdkSe67nkhxmNE7XRM21sUfwZp65OSaDMpWJGTXjClYbZxahxBveI/X60t7mhoFjyFZWMhR7RAYihsRFiNLPS7kPTmwMLg7+D+XAJGCFDGypgh+PgVFNxKYnBv+YhkZhhAc9LnVB5s5gbQ+AAUtQH47HoMHPFMEIhmhH7sEKDgCicLEk+MCABeWOx2CG3DYMT4YswjMGVZVYXkxk+4mBLZeDMQAfSXso81j9k2p+sQY4DT+50lIunUFAMsgFLUc6WjmIo9XY+qGjLMrkF3+5FvjIZRi8bpgIXWVfWVtWMoRjMbCQqT6/KPqHlLfd8DmaZbv8WUmx7mb2DT2pL9Nv/EQRA2KAIgbEAEUM9mewnG61aGNrtxlTa4xZ3/m0GMfUMBRFwu71j0wzs6W/JetnwjTi7ryw7drp9RA7MxAa+3zg52PwoVbD3XssGk6hxoz5GqYehhWdtstMbEF3qafnmD5p/JIFT4kFcK5HjNbonafil3NlxXecj92ZgfXo9S0MimrjOLttfKSpbNJ0qSsD741MDTPZTPMYruc5pA+YwPRewo2BCsZUfEfOlQHPuAx0p9CEvctBueDDQQZN9SHhsL3jqPVfZtc6g3HrCAQMMBBRw7PtCStPzDg13jPog01DuGOwa2TG7gxiNAuDaVnAtw6QbAyE0p2B3JY4dgasFKt9r+xGzcDAQ4/6kQEONHwPBnDfebDIwA56ObNftisDW+JSF6pbZho6AxnrNqhouQYGqdT7ulBTK8jsVhdCnvNeb8zZncFkfUAGQq15Knq5xMKA6Wg7A1GVqgIzmcakXZLDWjCGAgyMUYbd2kRfPA/ivk0chqHs1Z3anwEU3TYDA/6UwbUcwMMPDor/7LhysUF9XxvPoZcDNg/ysT2I3t7VhWT3sowvYcBqrNza9X7HuD7ftT3gZWMAWYHMBZ4TGn+xshp57Qys1w8M2Hwx36U9mJa3eFhWVXcV2jY6vjBokJ8rAwHlP2yBZ5X39BnMCTKAxtQ9MGiX9I0Y4MJ2C3nok2VxW9/dGSReJLPY/GFRTsDnymDss3BjhPrRGbDuKlwZWO3k92CAhp5hGJ5FV6CEyq+vA22uTN71uWdoKqz3c8XB1aC27NzSm0tvOnq9UsigzLUvhiuqR6vJ7Apud5qT3rsc1F7ylzn1pH2p1wdmpmmqza6JbIaD2NS3em3er+lH3b+VwLNocCZZ8atYU8LyMj2Zlu3XZLBp6zrZh332/uh28C6Jtfb+632z/jyeaD3DTjdLfWdigCIGxABFDIgBihgQAxQxIAYoYkAMUMSAGKCIATFAEQNigCIGxABFDIgBihgQAxQxIAYoYkAMUMSAGKCIATFAEQNigCIGxABFDIgBihgQAxQxIAYoYkAMUMSAGKCIATFAEQNigCIGxABFDO4YnFnbKrwza7fV46Tvrn8A2Mt2m9dX3zgAAAAASUVORK5CYII=';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
