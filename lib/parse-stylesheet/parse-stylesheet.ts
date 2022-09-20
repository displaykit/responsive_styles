import { breakpoints } from "@lib/breakpoints/breakpoints";

function parseStyleSheetRule(property: any, value: any) {
  if (property.includes("crossAxisAlignment")) {
    // crossAxisAlignment?: alignItems;
    return { alignItems: value };
  }
  if (property.includes("mainAxisAlignment")) {
    // mainAxisAlignment?: justifyContent;
    return { justifyContent: value };
  }

  if (property.includes("Vertical")) {
    const propertyBase = property.replace("Vertical", "");
    return {
      [`${propertyBase}-top`]: value,
      [`${propertyBase}-bottom`]: value,
    };
  }
  if (property.includes("Horizontal")) {
    const propertyBase = property.replace("Horizontal", "");
    return {
      [`${propertyBase}-left`]: value,
      [`${propertyBase}-right`]: value,
    };
  }

  return {
    [property]: value,
  };
}

function parseStyles({ mediaResultBy, stateResultBy }: any): any {
  return (acc: any, [styleSheetKey, styleSheetValue]: any) => {
    if (stateResultBy[styleSheetKey]) {
      const state = stateResultBy[styleSheetKey];
      const styleSheet = styleSheetValue;
      const output = Object.entries(styleSheet).reduce(
        parseStyles({ mediaResultBy, stateResultBy }),
        {}
      );
      return {
        ...acc,
        [state]: output,
      };
    }

    if (
      typeof styleSheetValue === "string" ||
      typeof styleSheetValue === "number"
    ) {
      const key = styleSheetKey;
      const value = styleSheetValue;
      return { ...acc, ...parseStyleSheetRule(key, value) };
    }

    if (typeof styleSheetValue === "object") {
      return {
        ...acc,
        ...Object.keys(mediaResultBy).reduce((mediaQuery, breakpoint) => {
          const currentMediaQuery = mediaResultBy[breakpoint];
          const currentRuleValue = styleSheetValue[breakpoint];
          if (!currentRuleValue) return mediaQuery;

          const rule = parseStyleSheetRule(styleSheetKey, currentRuleValue);

          return {
            ...mediaQuery,
            [currentMediaQuery]: {
              ...acc[currentMediaQuery],
              ...rule,
            },
          };
        }, {}),
      };
    }

    return { ...acc };
  };
}

export default function parseStyleSheet(
  styleSheet: unknown,
  uniqueId: string = "unique-id"
): any {
  const mediaResultBy = {
    xs: `@media (min-width: ${breakpoints.xs}px)`,
    sm: `@media (min-width: ${breakpoints.sm}px)`,
    md: `@media (min-width: ${breakpoints.md}px)`,
    lg: `@media (min-width: ${breakpoints.lg}px)`,
    xl: `@media (min-width: ${breakpoints.xl}px)`,
  };

  const stateResultBy = {
    hover: `&:hover, body.dark &.${uniqueId}:hover`,
    focus: `&:focus, body.dark &.${uniqueId}:focus`,
    disabled: `&:disabled, body.dark &.${uniqueId}:disabled`,
    modeDark: `body.dark &.${uniqueId}`,
  };

  const output = Object.entries(styleSheet).reduce(
    parseStyles({ mediaResultBy, stateResultBy }),
    {}
  );
  return output;
}
