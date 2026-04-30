import type { ManagedUser } from '@/types';

const API_BASE = '/api/admin';

export const userManagementService = {
  async getAllUsers(): Promise<ManagedUser[]> {
    const res = await fetch(`${API_BASE}/users`);
    if (!res.ok) throw new Error('Failed to fetch users');
    const { users } = await res.json();
    return users;
  },

  async inviteUser(email: string, roleName: string): Promise<string> {
    const res = await fetch(`${API_BASE}/invite`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email, roleName }),
    });
    const data = await res.json();
    if (!res.ok) throw new Error(data.error || 'Failed to invite user');
    return data.userId;
  },

  async updateUserRoles(userId: string, roles: string[]): Promise<void> {
    const res = await fetch(`${API_BASE}/users/${userId}/roles`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ roles }),
    });
    if (!res.ok) {
      const data = await res.json();
      throw new Error(data.error || 'Failed to update roles');
    }
  },

  async removeUser(userId: string): Promise<void> {
    const res = await fetch(`${API_BASE}/users/${userId}`, {
      method: 'DELETE',
    });
    if (!res.ok) {
      const data = await res.json();
      throw new Error(data.error || 'Failed to remove user');
    }
  },
};
