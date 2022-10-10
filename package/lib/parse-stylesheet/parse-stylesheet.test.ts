import parseStyleSheet from "./parse-stylesheet";

describe("parseStyleSheet()", () => {
  describe("when receive default stylesheet rules", () => {
    it("and it has only 1 stylesheet rule", () => {
      const input = parseStyleSheet({
        backgroundColor: "red",
      });

      expect(input).toEqual({ backgroundColor: "red" });
    });
    it("and it has only 2 stylesheet rules", () => {
      const input = parseStyleSheet({
        backgroundColor: "red",
        color: "white",
      });

      expect(input).toEqual({ backgroundColor: "red", color: "white" });
    });
    it("and it has only a stylesheet rule vertical and horizontal", () => {
      const input = parseStyleSheet({
        paddingVertical: "10px",
      });
      expect(input).toMatchSnapshot();
    });

    it("and it has a stylesheet for hover and focus", () => {
      const input = parseStyleSheet({
        backgroundColor: "red",
        hover: {
          backgroundColor: "blue",
        },
        focus: {
          backgroundColor: "black",
        },
      });
      expect(input).toMatchSnapshot();
    });
  });
  describe("when receive responsive stylesheet rules", () => {
    it("and it has only 1 stylesheet rule with 1 breakpoint", () => {
      const input = parseStyleSheet({
        backgroundColor: {
          xs: "red",
        },
      });

      expect(input).toMatchSnapshot();
    });
    it("and it has only 1 stylesheet rule with 2 breakpoints", () => {
      const input = parseStyleSheet({
        backgroundColor: {
          xs: "red",
          md: "black",
        },
      });
      expect(input).toMatchSnapshot();
    });
    it("and it has only a stylesheet rule vertical and horizontal with 2 breakpoints", () => {
      const input = parseStyleSheet({
        paddingVertical: {
          xs: "10px",
          md: "20px",
        },
        backgroundColor: {
          xs: "red",
          lg: "black",
        },
      });

      expect(input).toMatchSnapshot();
    });

    it("and it has a stylesheet for hover and focus", () => {
      const input = parseStyleSheet({
        backgroundColor: "red",
        hover: {
          backgroundColor: {
            xs: "blue",
            sm: "navy",
          },
        },
        focus: {
          backgroundColor: {
            xs: "black",
            md: "grey",
          },
        },
      });
      expect(input).toMatchSnapshot();
    });
  });

  describe("when receive an specific stylesheet rule", () => {
    it('and it is "mainAxisAlignment", must be converted to "justifyContent"', () => {
      const input = parseStyleSheet({
        mainAxisAlignment: "stretch",
        hover: {
          mainAxisAlignment: {
            xs: "center",
            sm: "stretch",
          },
        },
        focus: {
          mainAxisAlignment: {
            xs: "center",
            md: "stretch",
          },
        },
      });
      expect(input).toMatchSnapshot();
    });

    it('and it is "crossAxisAlignment", must be converted to "alignItems"', () => {
      const input = parseStyleSheet({
        crossAxisAlignment: "stretch",
        hover: {
          crossAxisAlignment: {
            xs: "center",
            sm: "stretch",
          },
        },
        focus: {
          crossAxisAlignment: {
            xs: "center",
            md: "stretch",
          },
        },
      });
      expect(input).toMatchSnapshot();
    });
  });
});
