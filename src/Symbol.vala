public class Markets.Symbol : Object {
    public enum MarketState {
        OPEN,
        CLOSED
    }

    public bool selected {
      get; set; // private
      default = false;
    }

    public string id {
      get; set; // private
    }

    public string instrument_type {
      get; set; // private
    }

    public string name {
      get; set; // private
    }

    public string exchange_name {
      get; set; // private
    }

    public MarketState market_state {
      get; set; // private
    }

    public DateTime regular_market_time {
      get; set; // private
    }

    public double regular_market_price {
      get; set; // private
    }

    public double regular_market_change {
      get; set; // private
    }

    public double regular_market_change_percent {
      get; set; // private
    }

    public void update(Json.Object json) {
      this.id = json.get_string_member("symbol");

      if (json.has_member("longname")) {
        this.name = json.get_string_member("longname");
      } else if (json.has_member("shortname")) {
        this.name = json.get_string_member("shortname");
      } else if (json.has_member("shortName")) {
        this.name = json.get_string_member("shortName");
      } else {
        this.name = "";
      }

      if (json.has_member("exchange")) {
        this.exchange_name = json.get_string_member("exchange");
      } else {
        this.exchange_name = "";
      }

      if (json.has_member("typeDisp")) {
        this.instrument_type = json.get_string_member("typeDisp");
      } else {
        this.instrument_type = "";
      }

      if (json.has_member("regularMarketPrice")) {
        this.regular_market_price =
            json.get_double_member("regularMarketPrice");
      }

      if (json.has_member("regularMarketChange")) {
        this.regular_market_change =
            json.get_double_member("regularMarketChange");
      }

      if (json.has_member("regularMarketChangePercent")) {
        this.regular_market_change_percent =
            json.get_double_member("regularMarketChangePercent");
      }

      // this.regular_market_time =
      //   new DateTime.from_unix_utc (json.get_int_member("regularMarketTime"));
    }

    public Symbol.from_json_object (Json.Object json) {
        this.update(json);
    }
  }
