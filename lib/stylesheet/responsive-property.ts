import { Breakpoints } from "@lib/breakpoints/breakpoints";

export type ResponsiveProperty<Type> = Partial<Record<Breakpoints, Type>>;
