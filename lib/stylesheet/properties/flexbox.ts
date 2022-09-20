import { ResponsiveProperty } from "../responsive-property";

export type flexDirection =
  | ResponsiveProperty<"row" | "column">
  | "row"
  | "column";

export type flex = ResponsiveProperty<number | string> | string | number;

export type alignItems =
  | ResponsiveProperty<"stretch" | "flex-start" | "flex-end" | "center">
  | "stretch"
  | "flex-start"
  | "flex-end"
  | "center";

export type justifyContent =
  | ResponsiveProperty<
      | "center"
      | "flex-start"
      | "flex-end"
      | "space-between"
      | "space-around"
      | "space-evenly"
    >
  | "center"
  | "flex-start"
  | "flex-end"
  | "space-between"
  | "spacearound"
  | "space-evenly";
