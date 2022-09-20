import Box from "@src/components/Box/Box";
import GlobalStyle from "@src/theme/GlobalStyle";

export default function HomeScreen() {
  return (
    <>
      <GlobalStyle />
      <Box
        styleSheet={{
          flex: 1,
          alignItems: "center",
          justifyContent: "center",
          fontFamily: "sans-serif",
          color: "white",
          backgroundColor: {
            xs: "#ff9090",
            sm: "#ffd586",
            md: "#81c681",
            lg: "#7d7dff",
            xl: "#f5afdc",
          },
          hover: {
            color: "#222222",
          },
        }}
      >
        HomeScreen
      </Box>
    </>
  );
}
