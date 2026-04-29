import { defineConfig } from '@prisma/config'

export default defineConfig({
    migrations: {
        seed: './prisma/seed.ts',
    },
    datasource: {
        url: process.env.DATABASE_URL || 'postgresql://placeholder:placeholder@localhost:5432/placeholder',
    },
})
