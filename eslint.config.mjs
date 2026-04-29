import js from "@eslint/js";
import tseslint from "typescript-eslint";
import react from "eslint-plugin-react";
import reactHooks from "eslint-plugin-react-hooks";
import jsxA11y from "eslint-plugin-jsx-a11y";
import globals from "globals";
import { fileURLToPath } from "node:url";
import path from "node:path";

// Define __dirname for ESM environments to ensure compatibility with environments 
// that do not yet support import.meta.dirname or have missing type definitions for it.
const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default [
  { ignores: ["dist", "node_modules"] },
  ...tseslint.config(
    {
      extends: [
        js.configs.recommended,
        ...tseslint.configs.strictTypeChecked,
        ...tseslint.configs.stylisticTypeChecked,
      ],
      files: ["**/*.{ts,tsx}"],
      languageOptions: {
        ecmaVersion: 2022,
        globals: globals.browser,
        parserOptions: {
          project: ["./tsconfig.json"],
          tsconfigRootDir: __dirname,
        },
      },
      plugins: {
        react,
        "react-hooks": reactHooks,
        "jsx-a11y": jsxA11y,
      },
      rules: {
        "react-hooks/rules-of-hooks": "error",
        "react-hooks/exhaustive-deps": "warn",
        "react/react-in-jsx-scope": "off",
        "react/prop-types": "off",
        
        "@typescript-eslint/no-explicit-any": "error",
        "@typescript-eslint/no-unused-vars": ["error", { "argsIgnorePattern": "^_", "varsIgnorePattern": "^_" }],
        "@typescript-eslint/consistent-type-imports": ["error", { "prefer": "type-imports" }],
        "@typescript-eslint/no-non-null-assertion": "error",
        "@typescript-eslint/restrict-template-expressions": "off", // overly strict for UI strings

        "jsx-a11y/alt-text": "error",
        "jsx-a11y/click-events-have-key-events": "error",
        "jsx-a11y/no-static-element-interactions": "error",
        "jsx-a11y/anchor-is-valid": "error",
        
        "no-case-declarations": "error",
        "no-constant-condition": "error",
      },
      settings: {
        react: { version: "detect" },
      },
    }
  )
];